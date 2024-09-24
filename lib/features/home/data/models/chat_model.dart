import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_project/core/models/person_model.dart';
import 'package:new_project/core/utils/chats_collection_data.dart';
import 'package:new_project/core/utils/message_collection_data.dart';

class ChatModel {
  final String message;
  final DateTime date;
  final String messageType;
  final PersonModel personModel;

  ChatModel({
    required this.message,
    required this.date,
    required this.messageType,
    required this.personModel,
  });

  factory ChatModel.fromjson(jsonData) {
    return ChatModel(
      messageType: jsonData[MessageCollectionData.messageType] ?? 'textMessage',
      date: (jsonData[ChatsCollectionData.messagePersonLastTime] as Timestamp)
          .toDate(),
      message: jsonData[ChatsCollectionData.messagePerronLastMessage],
      personModel: PersonModel.fromjson(jsonData),
    );
  }
}
