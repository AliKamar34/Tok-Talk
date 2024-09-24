import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_project/core/errors/failuer_error.dart';
import 'package:new_project/core/models/person_model.dart';
import 'package:new_project/core/utils/app_routes.dart';
import 'package:new_project/core/utils/chats_collection_data.dart';
import 'package:new_project/core/utils/friends_collection_data.dart';
import 'package:new_project/core/utils/user_collection_data.dart';
import 'package:new_project/features/settings/data/repos/settings_repo.dart';
import 'package:path/path.dart';

class SettingRepoImpl extends SettingsRepo {
  @override
  Future<Either<Failure, void>> logOutUser(
      {required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.signOut().whenComplete(() {
        GoRouter.of(context).push(AppRoutes.kSignInView);
      });
      return const Right(null);
    } catch (e) {
      return Left(FirebaseExceptionFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> upLoadProfileImage() async {
    File? file;
    String? url;

    try {
      final ImagePicker picker = ImagePicker();
      final XFile? imageFromGallery =
          await picker.pickImage(source: ImageSource.gallery);
      if (imageFromGallery != null) {
        file = File(imageFromGallery.path);
        var imageName = basename(imageFromGallery.path);
        var refStorage = FirebaseStorage.instance.ref(
            '${FirebaseAuth.instance.currentUser!.email}/profilePic/$imageName');
        await refStorage.putFile(file);
        url = await refStorage.getDownloadURL();
        log('message');
        log(url);
        User? currUser = FirebaseAuth.instance.currentUser;
        currUser!.updatePhotoURL(url);
      }
      // update data in collections
      upDateData(dataType: UserCollectionData.userImage, data: url);

      return const Right(null);
    } catch (e) {
      log(e.toString());
      return Left(FirebaseExceptionFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeProfileImage() async {
    try {
      FirebaseAuth.instance.currentUser!.updatePhotoURL('No Image');
      upDateData(dataType: UserCollectionData.userImage, data: 'No Image');
      return const Right(null);
    } catch (e) {
      return Left(FirebaseExceptionFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> upDateData(
      {required String dataType, String? data}) async {
    try {
      //udate data in users collection
      CollectionReference userData = FirebaseFirestore.instance
          .collection(UserCollectionData.userCollectionName);
      userData
          .doc(FirebaseAuth.instance.currentUser!.email)
          .update({dataType: data});

      //get my friends

      CollectionReference userFriends = FirebaseFirestore.instance
          .collection(UserCollectionData.userCollectionName)
          .doc(FirebaseAuth.instance.currentUser!.email!)
          .collection(FriendCollentionData.friendCollectionName)
          .doc('${FirebaseAuth.instance.currentUser!.email!} Friends')
          .collection(FriendCollentionData.userFriendCollentionData);

      final snapshot = await userFriends.get();
      List<PersonModel> friends =
          snapshot.docs.map((doc) => PersonModel.fromjson(doc.data())).toList();

      // loop in friends and updata user data for them
      for (var friend in friends) {
        userData
            .doc(friend.email)
            .collection(FriendCollentionData.friendCollectionName)
            .doc('${friend.email} Friends')
            .collection(FriendCollentionData.userFriendCollentionData)
            .doc(FirebaseAuth.instance.currentUser!.email)
            .update({dataType: data});
      }
      for (var friend in friends) {
        userData
            .doc(friend.email)
            .collection(ChatsCollectionData.messagesChatCollectionName)
            .doc(FirebaseAuth.instance.currentUser!.email)
            .update({dataType: data});
      }
      return const Right(null);
    } catch (e) {
      return Left(FirebaseExceptionFailure(e.toString()));
    }
  }
}
