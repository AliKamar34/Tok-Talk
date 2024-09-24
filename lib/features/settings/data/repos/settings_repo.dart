import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:new_project/core/errors/failuer_error.dart';

abstract class SettingsRepo {
  Future<Either<Failure, void>> logOutUser({required BuildContext context});
  Future<Either<Failure, void>> upLoadProfileImage();
  Future<Either<Failure, void>> upDateData(
      {required String dataType, String? data});
  Future<Either<Failure, void>> removeProfileImage();
  Future<Either<Failure, void>> upDateUserName({required String name});
}
