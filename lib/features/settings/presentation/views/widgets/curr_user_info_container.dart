
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_project/features/settings/presentation/views/widgets/custom_profile_info_container.dart';

class CurrUserInfo extends StatelessWidget {
  const CurrUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        CustomProfileInfoContainer(
          title: FirebaseAuth.instance.currentUser!.displayName!,
        ),
        CustomProfileInfoContainer(
          title: FirebaseAuth.instance.currentUser!.email!,
        ),
        CustomProfileInfoContainer(
          onPressed: () {},
          title: 'Edit Profile Photo',
        ),
      ],
    );
  }
}