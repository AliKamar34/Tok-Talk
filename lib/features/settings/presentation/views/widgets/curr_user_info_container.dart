import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_project/core/widgets/custom_backgtound_container.dart';
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
        CustomBackgoundContainer(
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              'Change photo',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        CustomProfileInfoContainer(
          title: 'Name',
          subTitle: FirebaseAuth.instance.currentUser!.displayName!,
          icon: Icons.account_circle,
        ),
        CustomProfileInfoContainer(
          title: 'Email',
          subTitle: FirebaseAuth.instance.currentUser!.email!,
          icon: Icons.email,
        ),
      ],
    );
  }
}
