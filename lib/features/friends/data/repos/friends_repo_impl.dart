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
    CollectionReference friend = FirebaseFirestore.instance
        .collection(UserCollectionData.userCollectionName)
        .doc(FirebaseAuth.instance.currentUser!.email!)
        .collection(FriendCollentionData.friendCollectionName)
        .doc('${FirebaseAuth.instance.currentUser!.email!} Friends')
        .collection(FriendCollentionData.userFriendCollentionData);

    try {
      List<PersonModel> friends = [];
      friend
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

  @override
  Future<Either<Failure, List<PersonModel>>> getRequests() async {
    CollectionReference requests = FirebaseFirestore.instance
        .collection(UserCollectionData.userCollectionName)
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection(FriendCollentionData.friendCollectionName)
        .doc('${FirebaseAuth.instance.currentUser!.email} Friends')
        .collection(FriendCollentionData.userFriendRequestsCollectionData);

    try {
      List<PersonModel> requestList = [];
      requests
          .orderBy(
            MessagesCollectionData.messagesPersonName,
            descending: true,
          )
          .snapshots()
          .listen(
        (event) {
          for (var docs in event.docs) {
            requestList.add(PersonModel.fromjson(docs));
          }
        },
      );
      return right(requestList);
    } catch (e) {
      return left(FirebaseExceptionFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> acceptRequest(
      {required PersonModel personModel}) async {
    try {
      CollectionReference userFriends = FirebaseFirestore.instance
          .collection(UserCollectionData.userCollectionName)
          .doc(personModel.email)
          .collection(FriendCollentionData.friendCollectionName)
          .doc('${personModel.email} Friends')
          .collection(FriendCollentionData.userFriendCollentionData);

      userFriends.doc(FirebaseAuth.instance.currentUser!.email!).set({
        FriendCollentionData.userFriendEmail:
            FirebaseAuth.instance.currentUser!.email!,
        FriendCollentionData.userFriendName:
            FirebaseAuth.instance.currentUser!.displayName,
        FriendCollentionData.userFriendImage:
            FirebaseAuth.instance.currentUser!.photoURL,
      });

      CollectionReference myFriends = FirebaseFirestore.instance
          .collection(UserCollectionData.userCollectionName)
          .doc(FirebaseAuth.instance.currentUser!.email!)
          .collection(FriendCollentionData.friendCollectionName)
          .doc('${FirebaseAuth.instance.currentUser!.email!} Friends')
          .collection(FriendCollentionData.userFriendCollentionData);

      myFriends.doc(personModel.email).set({
        FriendCollentionData.userFriendEmail: personModel.email,
        FriendCollentionData.userFriendName: personModel.name,
        FriendCollentionData.userFriendImage: personModel.image,
      });

      CollectionReference myRequests = FirebaseFirestore.instance
          .collection(UserCollectionData.userCollectionName)
          .doc(FirebaseAuth.instance.currentUser!.email!)
          .collection(FriendCollentionData.friendCollectionName)
          .doc('${FirebaseAuth.instance.currentUser!.email!} Friends')
          .collection(FriendCollentionData.userFriendRequestsCollectionData);
      myRequests.doc(personModel.email).delete();

      log('friernd accept  ${personModel.email}');
      return const Right(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(FirebaseExceptionFailure.fromFirebaseException(e));
      } else {
        return Left(FirebaseExceptionFailure(e.toString()));
      }
    }
  }
}
