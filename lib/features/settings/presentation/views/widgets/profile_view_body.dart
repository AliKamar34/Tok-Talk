import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_project/features/home/presentation/views/widgets/custom_cirlce_image.dart';
import 'package:new_project/features/settings/presentation/views/widgets/custom_profile_info_container.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(child: SizedBox()),
        Flexible(
          child: CustomCircleImage(
            imageUrl: FirebaseAuth.instance.currentUser!.photoURL ?? '',
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        CustomProfileInfoContainer(
          onPressed: () {},
          title: 'Edit Profile Photo',
        ),
        CustomProfileInfoContainer(
          title: FirebaseAuth.instance.currentUser!.displayName!,
        ),
        CustomProfileInfoContainer(
          title: FirebaseAuth.instance.currentUser!.email!,
        ),
        const Expanded(flex: 2, child: SizedBox()),
      ],
    );
  }
}
