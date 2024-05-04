import 'package:new_project/core/utils/messages_collection_data.dart';

class PersonModel {
  final String name;
  final String email;
  final String image;

  PersonModel({required this.name, required this.email, required this.image});

  factory PersonModel.fromjson(jsonData) {
    return PersonModel(
      name: jsonData[MessagesCollectionData.messagesPersonName],
      email: jsonData[MessagesCollectionData.messagesPersonEmail],
      image: jsonData[MessagesCollectionData.messagesPersonImage],
    );
  }
}
