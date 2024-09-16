import 'package:new_project/core/utils/chats_collection_data.dart';

class PersonModel {
  final String name;
  final String email;
  final String image;

  PersonModel({required this.name, required this.email, required this.image});

  factory PersonModel.fromjson(jsonData) {
    return PersonModel(
      name: jsonData[ChatsCollectionData.messagesPersonName],
      email: jsonData[ChatsCollectionData.messagesPersonEmail],
      image: jsonData[ChatsCollectionData.messagesPersonImage],
    );
  }
}
