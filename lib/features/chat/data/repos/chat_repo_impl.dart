import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_project/core/errors/failuer_error.dart';
import 'package:new_project/core/utils/chats_collection_data.dart';
import 'package:new_project/core/utils/message_collection_data.dart';
import 'package:new_project/core/utils/user_collection_data.dart';
import 'package:new_project/features/chat/data/models/enums/message_enum.dart';
import 'package:new_project/features/chat/data/models/message_model.dart';
import 'package:new_project/features/chat/data/repos/chat_repo.dart';

class ChatRepoImpl extends ChatRepo {
  @override
  Either<Failure, void> sendMessage(
    String message,
    MessageEnum messageEnum,
    String receverEmail,
    String receverPhoto,
    String receverName,
  ) {
    CollectionReference currUserMessages = FirebaseFirestore.instance
        .collection(UserCollectionData.userCollectionName)
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection(ChatsCollectionData.messagesChatCollectionName)
        .doc(receverEmail)
        .collection(ChatsCollectionData.messagesMessagesCollectionName);

    CollectionReference currUserChats = FirebaseFirestore.instance
        .collection(UserCollectionData.userCollectionName)
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection(ChatsCollectionData.messagesChatCollectionName);

    CollectionReference reseverMessages = FirebaseFirestore.instance
        .collection(UserCollectionData.userCollectionName)
        .doc(receverEmail)
        .collection(ChatsCollectionData.messagesChatCollectionName)
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection(ChatsCollectionData.messagesMessagesCollectionName);

    CollectionReference reseverChats = FirebaseFirestore.instance
        .collection(UserCollectionData.userCollectionName)
        .doc(receverEmail)
        .collection(ChatsCollectionData.messagesChatCollectionName);

    DocumentReference receverInfo = currUserChats.doc(receverEmail);
    DocumentReference currUserInfo =
        reseverChats.doc(FirebaseAuth.instance.currentUser!.email);

    try {
      receverInfo.set({
        ChatsCollectionData.messagePersonLastTime: DateTime.now(),
        ChatsCollectionData.messagesPersonImage: receverPhoto,
        ChatsCollectionData.messagesPersonName: receverName,
        ChatsCollectionData.messagesPersonEmail: receverEmail,
      });

      currUserInfo.set({
        ChatsCollectionData.messagePersonLastTime: DateTime.now(),
        ChatsCollectionData.messagesPersonImage:
            FirebaseAuth.instance.currentUser!.photoURL,
        ChatsCollectionData.messagesPersonName:
            FirebaseAuth.instance.currentUser!.displayName,
        ChatsCollectionData.messagesPersonEmail:
            FirebaseAuth.instance.currentUser!.email,
      });

      currUserMessages.add({
        MessageCollectionData.message: message,
        MessageCollectionData.messageType: messageEnum.name,
        MessageCollectionData.messageTime: DateTime.now(),
        MessageCollectionData.senderEmail:
            FirebaseAuth.instance.currentUser!.email,
        MessageCollectionData.receverEmail: receverEmail,
      });

      reseverMessages.add({
        MessageCollectionData.message: message,
        MessageCollectionData.messageType: messageEnum.name,
        MessageCollectionData.messageTime: DateTime.now(),
        MessageCollectionData.senderEmail:
            FirebaseAuth.instance.currentUser!.email,
        MessageCollectionData.receverEmail: receverEmail,
      });

      log(currUserInfo.toString());
      return right(null);
    } catch (e) {
      log(e.toString());
      return left(FirebaseExceptionFailure(e.toString()));
    }
  }

  @override
  Stream<Either<Failure, List<MessageModel>>> getMessages(
      {required String receverEmail}) {
    CollectionReference currUserMessages = FirebaseFirestore.instance
        .collection(UserCollectionData.userCollectionName)
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection(ChatsCollectionData.messagesChatCollectionName)
        .doc(receverEmail)
        .collection(ChatsCollectionData.messagesMessagesCollectionName);

    return currUserMessages
        .orderBy(MessageCollectionData.messageTime, descending: false)
        .snapshots()
        .map((snapShot) {
      try {
        List<MessageModel> messages =
            snapShot.docs.map((doc) => MessageModel.fromJson(doc)).toList();
        return right(messages);
      } catch (e) {
        return left(FirebaseExceptionFailure(e.toString()));
      }
    });
    // try {
    //   List<MessageModel> messages = [];
    //   currUserMessages
    //       .orderBy(MessageCollectionData.messageTime, descending: false)
    //       .snapshots()
    //       .listen((event)  async {
    //     messages.clear();
    //     for (var doc in event.docs) {
    //       log(event.docs.toString());
    //       log('event before add it into list');
    //       messages.add(MessageModel.fromJson(doc));
    //       log('messages =  ${messages.toString()}');
    //     }
    //   });
    //   log('messages length from repo ${messages.length.toString()}');

    //   return right(messages);
    // } catch (e) {
    //   return left(FirebaseExceptionFailure(e.toString()));
    // }
  }
}
