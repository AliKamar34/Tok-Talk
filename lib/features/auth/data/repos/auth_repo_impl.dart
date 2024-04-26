// ignore_for_file: unused_local_variable

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_project/core/utils/user_collection_data.dart';
import 'package:new_project/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<void> logInUser({
    required String email,
    required String password,
  }) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> registerUser({
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
              'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.flaticon.com%2Ffree-icon%2Fuser_3177440&psig=AOvVaw359pM1TAMJfLzyzqqysoQK&ust=1700596158590000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCODEysKs04IDFQAAAAAdAAAAABAE'
        },
        SetOptions(merge: true),
      );
      // }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('weak password');
        // showSnackBar(context, 'Weak password');
      } else if (e.code == 'email-already-in-use') {
        log('email already in use');
        
        // showSnackBar(context, 'Email already in use');
      }
    } catch (e) {
      log(e.toString());
      // showSnackBar(context, 'There was an error');
    }
  }
}
