import 'package:new_project/core/utils/chats_collection_data.dart';
import 'package:new_project/features/home/data/models/person_model.dart';

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
