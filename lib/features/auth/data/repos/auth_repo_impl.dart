// ignore_for_file: unused_local_variable



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:new_project/core/errors/failuer_error.dart';
import 'package:new_project/core/utils/user_collection_data.dart';
import 'package:new_project/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Failure, void>> logInUser({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
 
      return const Right(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(FirebaseExceptionFailure.fromFirebaseException(e));
      } else {
        return Left(FirebaseExceptionFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> registerUser({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
       

      User? user = userCredential.user;
      if (user != null) {
        await user.updateDisplayName(name);
      }

      CollectionReference users = FirebaseFirestore.instance
          .collection(UserCollectionData.userCollectionName);
      DocumentReference userDoc = users.doc(email);

      await userDoc.set(
        {
          UserCollectionData.userName: name,
          UserCollectionData.userEmail: email,
          UserCollectionData.userImage:
              'https://en.m.wikipedia.org/wiki/File:Sample_User_Icon.png'
        },
        SetOptions(merge: true),
      );
      return const Right(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(FirebaseExceptionFailure.fromFirebaseException(e));
      } else {
        return Left(FirebaseExceptionFailure(e.toString()));
      }
    }
  }
}
