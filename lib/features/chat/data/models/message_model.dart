
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_project/core/utils/message_collection_data.dart';

class MessageModel {
  final String message;
  final DateTime messageTime;
  final String messageType;
  final String receverEmail;
  final String senderEmail;

  MessageModel(
      {required this.message,
      required this.messageTime,
      required this.messageType,
      required this.receverEmail,
      required this.senderEmail});
  factory MessageModel.fromJson(jsonData) {
    return MessageModel(
      message: jsonData[MessageCollectionData.message],
      messageTime:
          (jsonData[MessageCollectionData.messageTime] as Timestamp).toDate(),
      messageType: jsonData[MessageCollectionData.messageType] ?? 'textMessage',
      receverEmail: jsonData[MessageCollectionData.receverEmail],
      senderEmail: jsonData[MessageCollectionData.senderEmail],
    );
  }
}

// class MessageModel {
//   final String message;
//   final DateTime messageTime;
//   final String messageType;
//   final String receverEmail;
//   final String senderEmail;

//   MessageModel(
//       {required this.message,
//       required this.messageTime,
//       required this.messageType,
//       required this.receverEmail,
//       required this.senderEmail});
//   factory MessageModel.fromjson(jsonData) {
//     return MessageModel(
//       message: jsonData['message'],
//       messageTime: (jsonData['messageTime'] as Timestamp).toDate(),
//       messageType: jsonData['messageType'],
//       receverEmail: jsonData['receverEmail'],
//       senderEmail: jsonData['senderEmail'],
//     );
//   }
// }
