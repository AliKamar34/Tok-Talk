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
