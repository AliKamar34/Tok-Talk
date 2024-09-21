import 'dart:developer';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_project/core/errors/failuer_error.dart';
import 'package:new_project/core/utils/chats_collection_data.dart';
import 'package:new_project/core/utils/message_collection_data.dart';
import 'package:new_project/core/utils/user_collection_data.dart';
import 'package:new_project/features/chat/data/models/enums/message_enum.dart';
import 'package:new_project/features/chat/data/repos/chat_repo.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:uuid/uuid.dart';

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
        ChatsCollectionData.messagePerronLastMessage: message,
      });

      currUserInfo.set({
        ChatsCollectionData.messagePersonLastTime: DateTime.now(),
        ChatsCollectionData.messagesPersonImage:
            FirebaseAuth.instance.currentUser!.photoURL,
        ChatsCollectionData.messagesPersonName:
            FirebaseAuth.instance.currentUser!.displayName,
        ChatsCollectionData.messagesPersonEmail:
            FirebaseAuth.instance.currentUser!.email,
        ChatsCollectionData.messagePerronLastMessage: message,
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
  Future<Either<Failure, void>> sendImage(
    String receverEmail,
    String receverPhoto,
    String receverName,
  ) async {
    File? file;
    String? url;

    try {
      final ImagePicker picker = ImagePicker();
      final XFile? imageFromGallery =
          await picker.pickImage(source: ImageSource.gallery);
      if (imageFromGallery != null) {
        file = File(imageFromGallery.path);
        var imageName = basename(imageFromGallery.path);
        var refStorage = FirebaseStorage.instance.ref(
            '${FirebaseAuth.instance.currentUser!.email}/imageMessages/$imageName');
        await refStorage.putFile(file);
        url = await refStorage.getDownloadURL();
        log('message');
        log(url);
      }
      sendMessage(
        url ?? '',
        MessageEnum.imageMessage,
        receverEmail,
        receverPhoto,
        receverName,
      );
      return right(null);
    } catch (e) {
      return left(FirebaseExceptionFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> sendRecord(
    String receverEmail,
    String receverPhoto,
    String receverName,
  ) async {
    try {
      path = await record.stop();
      log('record stoped');
      var refStorage = FirebaseStorage.instance.ref(
          '${FirebaseAuth.instance.currentUser!.email}/recordMessages/$path');
      await refStorage.putFile(File(path!));
      url = await refStorage.getDownloadURL();
      sendMessage(
        url ?? '',
        MessageEnum.recordMessage,
        receverEmail,
        receverPhoto,
        receverName,
      );
      return right(null);
    } catch (e) {
      return left(FirebaseExceptionFailure(e.toString()));
    }
  }

  String? path;
  String? url;

  final record = AudioRecorder();
  @override
  Future<Either<Failure, void>> startRecording() async {
    try {
      final location = await getApplicationDocumentsDirectory();
      String name = const Uuid().v1();
      if (await record.hasPermission()) {
        await record.start(const RecordConfig(),
            path: '${location.path}$name.m4a');
      }
      log('record started');
      return right(null);
    } catch (e) {
      return left(FirebaseExceptionFailure(e.toString()));
    }
  }

  AudioPlayer audioPlayer = AudioPlayer();
  @override
  playRecord(url) async {
   
      await audioPlayer.play(UrlSource(url));
      log('audio played');
      return true;
    
  }

  @override
  stopRecord() async {
   
      await audioPlayer.stop();
      log('audio stoped');
      return false;
    
  }
}
