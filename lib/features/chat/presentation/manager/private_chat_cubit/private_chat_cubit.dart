import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/core/utils/chats_collection_data.dart';
import 'package:new_project/core/utils/message_collection_data.dart';
import 'package:new_project/core/utils/user_collection_data.dart';
import 'package:new_project/features/chat/data/models/message_model.dart';
import 'package:new_project/features/chat/data/repos/chat_repo.dart';

part 'private_chat_state.dart';

class PrivateChatCubit extends Cubit<PrivateChatState> {
  PrivateChatCubit(this.chatRepo) : super(PrivateChatInitial());

  final ChatRepo chatRepo;

  void getMessages({required String receverEmail}) {
    emit(PrivateChatLoading());

    CollectionReference currUserMessages = FirebaseFirestore.instance
        .collection(UserCollectionData.userCollectionName)
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection(ChatsCollectionData.messagesChatCollectionName)
        .doc(receverEmail)
        .collection(ChatsCollectionData.messagesMessagesCollectionName);

    try {
      currUserMessages
          .orderBy(MessageCollectionData.messageTime, descending: false)
          .snapshots()
          .listen((event) {
        List<MessageModel> messages =
            event.docs.map((doc) => MessageModel.fromJson(doc)).toList();

        log('list in cubit  before emit state =  ${messages.length.toString()}');
        log('event in cubit before emit state = ${event.docs.length}');
        
          emit(PrivateChatSuccess(messages: messages));
       

        log('list in cubit  after emit state=  ${messages.length.toString()}');
        log('event in cubit after emit state = ${event.docs.length}');
      });
    } catch (e) {
      emit(PrivateChatFailure(errMessage: e.toString()));
    }
  }
}
