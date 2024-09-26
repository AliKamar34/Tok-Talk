import 'package:new_project/core/models/person_model.dart';
import 'package:new_project/core/utils/chats_collection_data.dart';
















class GroupModel {
  final String name;
  final String image;
  final List<PersonModel> members;

  GroupModel({required this.name, required this.image, required this.members});

  factory GroupModel.formJson(jsonData) {
    return GroupModel(
      name: jsonData[ChatsCollectionData.messsageGroupName],
      image: jsonData[ChatsCollectionData.messsageGroupImage],
      members: jsonData[ChatsCollectionData.messsageGroupmembers],
    );
  }
}
