import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_project/features/home/presentation/views/widgets/custom_cirlce_image.dart';

class CustomSettingAppBar extends StatelessWidget {
  const CustomSettingAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        Flexible(
          child: CustomCircleImage(
            imageUrl: FirebaseAuth.instance.currentUser!.photoURL ?? '',
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          FirebaseAuth.instance.currentUser!.displayName!,
          style: const TextStyle(
            fontSize: 26,
          ),
        ),
      ],
    );
  }
}
