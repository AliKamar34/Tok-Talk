import 'package:flutter/material.dart';
import 'package:new_project/core/models/person_model.dart';
import 'package:new_project/features/settings/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.personModel});
  final PersonModel personModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ProfileViewBody(personModel: personModel),
      ),
    );
  }
}
