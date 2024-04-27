// import 'package:firebase_auth/firebase_auth.dart';

// abstract class Failuer {
//   final String errorMessage;

//   const Failuer(this.errorMessage);
// }

// class FirebaseExption extends Failuer {
//   FirebaseExption(super.errorMessage);

//   factory FirebaseExption.formFirebaseExption(
//       FirebaseException firebaseException) {
//     return FirebaseException.message ?? 'there is an error in fire base failuer';
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';


abstract class Failure {
  final String errorMessage;

  const Failure(this.errorMessage);
}


class FirebaseExceptionFailure extends Failure {
  FirebaseExceptionFailure(super.errorMessage);


  factory FirebaseExceptionFailure.fromFirebaseException(
      FirebaseException firebaseException) {
    
    String errorMessage = firebaseException.message ?? 'An error occurred';
    return FirebaseExceptionFailure(errorMessage);
  }
}




// on FirebaseAuthException catch (e) {
        //     if (e.code == 'user-not-found') {
        //       emit(LogInFailuer(errMessage: 'No user found for that email'));
        //     } else if (e.code == 'wrong-password') {
        //       emit(LogInFailuer(errMessage: 'Wrong password'));
        //     } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        //       emit(LogInFailuer(errMessage: 'email or password is wrong'));
        //     } else if (e.code == 'too-many-requests') {
        //       emit(LogInFailuer(
        //           errMessage: 'too many requests , please try again later'));
        //     }
        //   }
        //  on FirebaseAuthException catch (e) {
        //     if (e.code == 'weak-password') {
        //       emit(RegisterFailuer(errMessage: 'Weak password'));
        //     } else if (e.code == 'email-already-in-use') {
        //       emit(RegisterFailuer(errMessage: 'Email already in use'));
        //     }