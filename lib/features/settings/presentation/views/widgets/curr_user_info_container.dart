import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_project/features/settings/presentation/views/widgets/custom_bottom_sheet.dart';
import 'package:new_project/features/settings/presentation/views/widgets/custom_profile_info_container.dart';

class CurrUserInfo extends StatelessWidget {
  const CurrUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        CustomProfileInfoContainer(
          title: 'Name',
          subTitle: FirebaseAuth.instance.currentUser!.displayName!,
          icon: Icons.account_circle,
          onPressed: () {
            showBottomSheet(context);
          },
        ),
        CustomProfileInfoContainer(
          title: 'Email',
          subTitle: FirebaseAuth.instance.currentUser!.email!,
          icon: Icons.email,
        ),
      ],
    );
  }

  Future<dynamic> showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const CustomBottomSheet();
      },
    );
  }
}

