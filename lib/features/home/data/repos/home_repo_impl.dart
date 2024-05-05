import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_project/core/errors/failuer_error.dart';
import 'package:new_project/core/utils/messages_collection_data.dart';
import 'package:new_project/core/utils/user_collection_data.dart';
import 'package:new_project/features/home/data/models/group_model.dart';
import 'package:new_project/features/home/data/models/person_model.dart';
import 'package:new_project/features/home/data/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  @override
  Future<Either<Failure, List<PersonModel>>> getChats() async {
    CollectionReference chats = FirebaseFirestore.instance
        .collection(UserCollectionData.userCollectionName)
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection(MessagesCollectionData.messagesChatCollectionName);

    try {
      List<PersonModel> persons = [];
      chats
          .orderBy(
            // UserCollectionData.userName,
            MessagesCollectionData.messagePersonLastTime,
            descending: true,
          )
          .snapshots()
          .listen(
        (event) {
          for (var docs in event.docs) {
            persons.add(PersonModel.fromjson(docs));
          }
          log('data form home repo');
          log(persons.length.toString());
          log(persons.toString());

          log(event.docs.toString());
          log(FirebaseAuth.instance.currentUser!.email.toString());
        },
      );
      return right(persons);
    } catch (e) {
      return left(FirebaseExceptionFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<GroupModel>>> getGroups() async {
     CollectionReference chats = FirebaseFirestore.instance
        .collection(UserCollectionData.userCollectionName)
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection(MessagesCollectionData.messagesGroupCollectionName);

    try {
      List<GroupModel> groups = [];
      chats
          .orderBy(
            MessagesCollectionData.messagePersonLastTime,
            descending: true,
          )
          .snapshots()
          .listen(
        (event) {
          for (var docs in event.docs) {
            groups.add(GroupModel.formJson(docs));
          }
          log('data form home repo');
          log(groups.length.toString());
          log(groups.toString());

          log(event.docs.toString());
          log(FirebaseAuth.instance.currentUser!.email.toString());
        },
      );
      return right(groups);
    } catch (e) {
      return left(FirebaseExceptionFailure(e.toString()));
    }
  }
}
