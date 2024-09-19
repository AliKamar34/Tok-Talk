import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_project/core/errors/failuer_error.dart';
import 'package:new_project/core/utils/friends_collection_data.dart';
import 'package:new_project/core/utils/chats_collection_data.dart';
import 'package:new_project/core/utils/user_collection_data.dart';
import 'package:new_project/features/friends/data/repos/friends_repo.dart';
import 'package:new_project/features/home/data/models/person_model.dart';

class FriendsRepoImpl extends FriendsRepo {
  @override
  Future<Either<Failure, void>> addFriend({required String personEmail}) async {
    CollectionReference requests = FirebaseFirestore.instance
        .collection(UserCollectionData.userCollectionName)
        .doc(personEmail)
        .collection(FriendCollentionData.friendCollectionName)
        .doc('$personEmail Friends')
        .collection(FriendCollentionData.userFriendRequestsCollectionData);

    try {
      requests.doc(FirebaseAuth.instance.currentUser!.email!).set({
        FriendCollentionData.userFriendEmail:
            FirebaseAuth.instance.currentUser!.email!,
        FriendCollentionData.userFriendName:
            FirebaseAuth.instance.currentUser!.displayName,
        FriendCollentionData.requestFriendStatus: 'pendinghhhh',
        FriendCollentionData.userFriendImage:
            FirebaseAuth.instance.currentUser!.photoURL ?? ' ',
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
  Future<Either<Failure, void>> acceptRequest(
      {required PersonModel personModel}) async {
    CollectionReference userFriends = FirebaseFirestore.instance
        .collection(UserCollectionData.userCollectionName)
        .doc(personModel.email)
        .collection(FriendCollentionData.friendCollectionName)
        .doc('${personModel.email} Friends')
        .collection(FriendCollentionData.userFriendCollentionData);

    CollectionReference myFriends = FirebaseFirestore.instance
        .collection(UserCollectionData.userCollectionName)
        .doc(FirebaseAuth.instance.currentUser!.email!)
        .collection(FriendCollentionData.friendCollectionName)
        .doc('${FirebaseAuth.instance.currentUser!.email!} Friends')
        .collection(FriendCollentionData.userFriendCollentionData);

    try {
      userFriends.doc(FirebaseAuth.instance.currentUser!.email!).set({
        FriendCollentionData.userFriendEmail:
            FirebaseAuth.instance.currentUser!.email!,
        FriendCollentionData.userFriendName:
            FirebaseAuth.instance.currentUser!.displayName,
        FriendCollentionData.userFriendImage:
            FirebaseAuth.instance.currentUser!.photoURL ?? ' ',
      });

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

  // @override
  // Stream<Either<Failure, List<PersonModel>>> getFriends() {
  //   CollectionReference friend = FirebaseFirestore.instance
  //       .collection(UserCollectionData.userCollectionName)
  //       .doc(FirebaseAuth.instance.currentUser!.email!)
  //       .collection(FriendCollentionData.friendCollectionName)
  //       .doc('${FirebaseAuth.instance.currentUser!.email!} Friends')
  //       .collection(FriendCollentionData.userFriendCollentionData);

  //   return friend
  //       .orderBy(ChatsCollectionData.messagesPersonName, descending: true)
  //       .snapshots()
  //       .map((snapshot) {
  //     try {
  //       List<PersonModel> friends =
  //           snapshot.docs.map((doc) => PersonModel.fromjson(doc)).toList();
  //       log(friends.length.toString());
  //       log('message from friends repo ');
  //       return right(friends);
  //     } catch (e) {
  //       return left(FirebaseExceptionFailure(e.toString()));
  //     }
  //   });
  // }

  // @override
  // Stream<Either<Failure, List<PersonModel>>> getRequests() {
  //   CollectionReference requests = FirebaseFirestore.instance
  //       .collection(UserCollectionData.userCollectionName)
  //       .doc(FirebaseAuth.instance.currentUser!.email)
  //       .collection(FriendCollentionData.friendCollectionName)
  //       .doc('${FirebaseAuth.instance.currentUser!.email} Friends')
  //       .collection(FriendCollentionData.userFriendRequestsCollectionData);

  //   return requests
  //       .orderBy(ChatsCollectionData.messagesPersonName, descending: true)
  //       .snapshots()
  //       .map((snapshot) {
  //     try {
  //       List<PersonModel> requestsList =
  //           snapshot.docs.map((doc) => PersonModel.fromjson(doc)).toList();
  //       log(requestsList.length.toString());
  //       log('message from friends repo ');
  //       return right(requestsList);
  //     } catch (e) {
  //       return left(FirebaseExceptionFailure(e.toString()));
  //     }
  //   });
  // }
}
