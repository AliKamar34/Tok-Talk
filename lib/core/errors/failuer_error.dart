import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure {
  final String errorMessage;

  const Failure(this.errorMessage);
}

class FirebaseExceptionFailure extends Failure {
  FirebaseExceptionFailure(super.errorMessage);

  factory FirebaseExceptionFailure.fromFirebaseException(
      FirebaseException firebaseException) {
    if (firebaseException.code == 'email-already-in-use') {
      return FirebaseExceptionFailure('email already in use');
    } else if (firebaseException.code == 'weak-password') {
      return FirebaseExceptionFailure('weak password');
    } else if (firebaseException.code == 'user-not-found') {
      return FirebaseExceptionFailure('No user found for that email');
    } else if (firebaseException.code == 'wrong-password') {
      return FirebaseExceptionFailure('Wrong password');
    } else if (firebaseException.code == 'invalid-credential') {
      return FirebaseExceptionFailure('invalid password');
    } else if (firebaseException.code == 'invalid-email') {
      return FirebaseExceptionFailure('invalid email');
    } else if (firebaseException.code == 'INVALID_LOGIN_CREDENTIALS') {
      return FirebaseExceptionFailure('email or password is wrong');
    } else if (firebaseException.code == 'too-many-requests') {
      return FirebaseExceptionFailure(
          'too many requests , please try again later');
    }
    log(firebaseException.code);
    return FirebaseExceptionFailure(firebaseException.code);
  }
}
