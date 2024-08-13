import 'package:dartz/dartz.dart';
import 'package:new_project/core/errors/failuer_error.dart';
import 'package:new_project/features/home/data/models/person_model.dart';

abstract class FriendsRepo {
  Stream<Either<Failure, List<PersonModel>>> getFriends();
  Stream<Either<Failure, List<PersonModel>>> getRequests();
  Future<Either<Failure, void>> addFriend({required String personEmail});
  Future<Either<Failure, void>> acceptRequest({required PersonModel personModel});
}
