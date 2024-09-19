import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_project/core/models/person_model.dart';
import 'package:new_project/core/utils/chats_collection_data.dart';

class ChatModel {
  // final String name;
  // final String email;
  // final String image;
  final String message;
  final DateTime date;
  final PersonModel personModel;

  ChatModel({
    // required this.name,
    // required this.email,
    // required this.image,
    required this.message,
    required this.date,
    required this.personModel,
  });

  factory ChatModel.fromjson(jsonData) {
    return ChatModel(
      // name: jsonData[ChatsCollectionData.messagesPersonName],
      // email: jsonData[ChatsCollectionData.messagesPersonEmail],
      // image: jsonData[ChatsCollectionData.messagesPersonImage],
      date: (jsonData[ChatsCollectionData.messagePersonLastTime] as Timestamp)
          .toDate(),
      message: jsonData[ChatsCollectionData.messagePerronLastMessage],
      personModel: PersonModel.fromjson(jsonData),
    );
  }
}
