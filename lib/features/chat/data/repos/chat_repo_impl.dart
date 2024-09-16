import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_project/core/errors/failuer_error.dart';
import 'package:new_project/core/utils/chats_collection_data.dart';
import 'package:new_project/core/utils/message_collection_data.dart';
import 'package:new_project/core/utils/user_collection_data.dart';
import 'package:new_project/features/chat/data/models/enums/message_enum.dart';
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
      currUserMessages.add({
        MessageCollectionData.message: message,
        MessageCollectionData.messageType: messageEnum,
        MessageCollectionData.messageTime: DateTime.now(),
        MessageCollectionData.senderEmail:
            FirebaseAuth.instance.currentUser!.email,
        MessageCollectionData.receverEmail: receverEmail,
      });

      reseverMessages.add({
        MessageCollectionData.message: message,
        MessageCollectionData.messageType: messageEnum,
        MessageCollectionData.messageTime: DateTime.now(),
        MessageCollectionData.senderEmail:
            FirebaseAuth.instance.currentUser!.email,
        MessageCollectionData.receverEmail: receverEmail,
      });

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
      return right(null);
    } catch (e) {
      return left(FirebaseExceptionFailure(e.toString()));
    }
  }
}
