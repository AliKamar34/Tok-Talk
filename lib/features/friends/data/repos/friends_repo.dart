import 'package:dartz/dartz.dart';
import 'package:new_project/core/errors/failuer_error.dart';
import 'package:new_project/features/home/data/models/person_model.dart';

abstract class FriendsRepo {
  Future<Either<Failure, List<PersonModel>>> getFriends();
  Future<Either<Failure, void>> addFriend({required String personEmail});
}
