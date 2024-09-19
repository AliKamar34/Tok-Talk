import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/core/utils/chats_collection_data.dart';
import 'package:new_project/core/utils/user_collection_data.dart';
import 'package:new_project/features/home/data/models/person_model.dart';

part 'chats_state.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit() : super(ChatsInitial());

  // final HomeRepo homeRepo;

  // Future<void> getChats() async {
  //   emit(ChatsLoading());
  //   var result = await homeRepo.getChats();
  //   result.fold((failuer) {
  //     emit(ChatsFailuer(errMessage: failuer.errorMessage));
  //   }, (chats) {
  //     emit(ChatsSuccess(persons: chats));
  //   });
  // }

  getChats() {
    emit(ChatsLoading());
    CollectionReference chats = FirebaseFirestore.instance
        .collection(UserCollectionData.userCollectionName)
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection(ChatsCollectionData.messagesChatCollectionName);

    try {
      chats
          .orderBy(
            ChatsCollectionData.messagePersonLastTime,
            descending: true,
          )
          .snapshots()
          .listen(
        (event) {
          List<PersonModel> persons =
              event.docs.map((doc) => PersonModel.fromjson(doc)).toList();
          emit(ChatsSuccess(persons: persons));
        },
      );
    } catch (e) {
      emit(ChatsFailuer(errMessage: e.toString()));
    }
  }
}
