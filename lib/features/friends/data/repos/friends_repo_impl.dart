import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_project/core/errors/failuer_error.dart';
import 'package:new_project/core/utils/friends_collection_data.dart';
import 'package:new_project/core/utils/messages_collection_data.dart';
import 'package:new_project/core/utils/user_collection_data.dart';
import 'package:new_project/features/friends/data/repos/friends_repo.dart';
import 'package:new_project/features/home/data/models/person_model.dart';

class FriendsRepoImpl extends FriendsRepo {
  @override
  Future<Either<Failure, void>> addFriend({required String personEmail}) async {
    try {
      CollectionReference requests = FirebaseFirestore.instance
          .collection(UserCollectionData.userCollectionName)
          .doc(personEmail)
          .collection(FriendCollentionData.friendCollectionName)
          .doc('$personEmail Friends')
          .collection(FriendCollentionData.userFriendRequestsCollectionData);

      requests.doc(FirebaseAuth.instance.currentUser!.email!).set({
        FriendCollentionData.userFriendEmail:
            FirebaseAuth.instance.currentUser!.email!,
        FriendCollentionData.userFriendName:
            FirebaseAuth.instance.currentUser!.displayName,
        FriendCollentionData.requestFriendStatus: 'pendinghhhh',
        FriendCollentionData.userFriendImage:
            FirebaseAuth.instance.currentUser!.photoURL,
      });

      log('requist sent to $personEmail');
      return const Right(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(FirebaseExceptionFailure.fromFirebaseException(e));
      } else {
        return Left(FirebaseExceptionFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<PersonModel>>> getFriends() async {
    CollectionReference chats = FirebaseFirestore.instance
        .collection(UserCollectionData.userCollectionName)
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection(MessagesCollectionData.messagesFriendsCollectionName);

    try {
      List<PersonModel> friends = [];
      chats
          .orderBy(
            MessagesCollectionData.messagesPersonName,
            descending: true,
          )
          .snapshots()
          .listen(
        (event) {
          for (var docs in event.docs) {
            friends.add(PersonModel.fromjson(docs));
          }
          log('data form home repo');
          log(friends.length.toString());
          log(friends.toString());

          log(event.docs.toString());
          log(FirebaseAuth.instance.currentUser!.email.toString());
        },
      );
      return right(friends);
    } catch (e) {
      return left(FirebaseExceptionFailure(e.toString()));
    }
  }
}
