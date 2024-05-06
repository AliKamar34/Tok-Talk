import 'package:dartz/dartz.dart';
import 'package:new_project/core/errors/failuer_error.dart';
import 'package:new_project/features/home/data/models/group_model.dart';
import 'package:new_project/features/home/data/models/person_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<PersonModel>>> getChats();
  Future<Either<Failure, List<GroupModel>>> getGroups();
  Future<Either<Failure, List<PersonModel>>> getFriends();

}
