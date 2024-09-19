import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/core/utils/chats_collection_data.dart';
import 'package:new_project/core/utils/user_collection_data.dart';
import 'package:new_project/features/home/data/models/group_model.dart';

part 'groups_state.dart';

class GroupsCubit extends Cubit<GroupsState> {
  GroupsCubit() : super(GroupsInitial());

  // final HomeRepo homeRepo;

  // Future<void> getGroups() async {
  //   emit(GroupsLoading());
  //   var result = await homeRepo.getGroups();
  //   result.fold((failure) {
  //     emit(GroupsFailuer(errMessage: failure.errorMessage));
  //   }, (groups) {
  //     emit(GroupsSuccess(groups: groups));
  //   });
  // }
  
  getGroups() {
    emit(GroupsLoading());
       CollectionReference chats = FirebaseFirestore.instance
        .collection(UserCollectionData.userCollectionName)
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection(ChatsCollectionData.messagesGroupCollectionName);

    try {
      chats
          .orderBy(
            ChatsCollectionData.messagePersonLastTime,
            descending: true,
          )
          .snapshots()
          .listen(
        (event) {
          List<GroupModel> groups =
              event.docs.map((doc) => GroupModel.formJson(doc)).toList();
          emit(GroupsSuccess(groups: groups));
        },
      );
    } catch (e) {
      emit(GroupsFailuer(errMessage: e.toString()));
    }
  }
}
