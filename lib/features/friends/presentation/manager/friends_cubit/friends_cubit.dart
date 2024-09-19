import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/core/utils/chats_collection_data.dart';
import 'package:new_project/core/utils/friends_collection_data.dart';
import 'package:new_project/core/utils/user_collection_data.dart';
import 'package:new_project/features/friends/data/repos/friends_repo.dart';
import 'package:new_project/features/home/data/models/person_model.dart';
part 'friends_state.dart';

class FriendsCubit extends Cubit<FriendsState> {
  FriendsCubit(this.friendsRepo) : super(FriendsInitial());

  final FriendsRepo friendsRepo;

  // StreamSubscription? _friendsSubscription;

  // void getFriends() {
  //   emit(FriendsLoading());

  //   _friendsSubscription = friendsRepo.getFriends().listen(
  //     (event) {
  //       event.fold(
  //         (failure) {
  //           emit(FriendsFailuer(errMessage: failure.errorMessage));
  //         },
  //         (friends) {
  //           log(friends.length.toString());
  //           log('message from cubit');
  //           emit(FriendsSuccess(friends: friends));
  //         },
  //       );
  //     },
  //   );
  // }

  // @override
  // Future<void> close() {
  //   _friendsSubscription?.cancel();
  //   return super.close();
  // }
  getFriends() {
    emit(FriendsLoading());
    CollectionReference friend = FirebaseFirestore.instance
        .collection(UserCollectionData.userCollectionName)
        .doc(FirebaseAuth.instance.currentUser!.email!)
        .collection(FriendCollentionData.friendCollectionName)
        .doc('${FirebaseAuth.instance.currentUser!.email!} Friends')
        .collection(FriendCollentionData.userFriendCollentionData);
    try {
      friend
         .orderBy(ChatsCollectionData.messagesPersonName, descending: true)
        .snapshots()
          .listen(
        (event) {
          List<PersonModel> friends =
              event.docs.map((doc) => PersonModel.fromjson(doc)).toList();
          emit(FriendsSuccess(friends: friends));
        },
      );
    } catch (e) {
      emit(FriendsFailuer(errMessage: e.toString()));
    }
  
  }
}
