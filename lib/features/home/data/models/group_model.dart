import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_project/core/models/person_model.dart';
import 'package:new_project/core/utils/chats_collection_data.dart';
import 'package:new_project/core/utils/message_collection_data.dart';

class GroupModel {
  final String groupName;
  final String groupImage;
  final String message;
  final DateTime date;
  final String messageType;
  final List<PersonModel> members;

  GroupModel(
      {required this.message,
      required this.date,
      required this.messageType,
      required this.groupName,
      required this.groupImage,
      required this.members});

  factory GroupModel.formJson(jsonData) {
    return GroupModel(
      groupName: jsonData[ChatsCollectionData.messsageGroupName],
      groupImage: jsonData[ChatsCollectionData.messsageGroupImage],
      members: PersonModel.fromjson(jsonData) as List<PersonModel>,
      messageType: jsonData[MessageCollectionData.messageType] ?? 'textMessage',
      date: (jsonData[ChatsCollectionData.messagePersonLastTime] as Timestamp)
          .toDate(),
      message: jsonData[ChatsCollectionData.messagePerronLastMessage],
    );
  }
}
