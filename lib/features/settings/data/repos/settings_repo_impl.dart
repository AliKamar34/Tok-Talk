import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_project/core/errors/failuer_error.dart';
import 'package:new_project/core/utils/app_routes.dart';
import 'package:new_project/features/settings/data/repos/settings_repo.dart';

class SettingRepoImpl extends SettingsRepo {
  @override
  Future<Either<Failure, void>> logOutUser(
      {required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.signOut().whenComplete(() {
        GoRouter.of(context).push(AppRoutes.kSignInView);
      });
      return const Right(null);
    } catch (e) {
      return  Left(
          FirebaseExceptionFailure(e.toString()));
    }
  }
}
