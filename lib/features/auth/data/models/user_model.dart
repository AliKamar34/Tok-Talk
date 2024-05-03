import 'package:new_project/core/utils/user_collection_data.dart';

class UserModel {
  final String name;
  final String email;
  final String? image;

  UserModel({
    required this.name,
    required this.email,
    this.image,
  });

  factory UserModel.fromJson(jsondata) {
    return UserModel(
      name: jsondata[UserCollectionData.userName],
      email: jsondata[UserCollectionData.userEmail],
      image: jsondata[UserCollectionData.userImage],
    );
  }
}
