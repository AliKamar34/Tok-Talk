import 'package:dartz/dartz.dart';
import 'package:new_project/core/errors/failuer_error.dart';
import 'package:new_project/core/models/person_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<PersonModel>>> searchForFriend({required String personName});
}

