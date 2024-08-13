import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_project/core/widgets/custom_backgtound_container.dart';
import 'package:new_project/features/home/presentation/views/widgets/custom_cirlce_image.dart';
import 'package:new_project/features/settings/presentation/views/widgets/curr_user_info_container.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            child: Column(
              children: [
                Flexible(
                  child: SizedBox(
                    width: 250,
                    child: CustomCircleImage(
                      imageUrl:
                          FirebaseAuth.instance.currentUser!.photoURL ?? '',
                    ),
                  ),
                ),
                const CurrUserInfo(),
                CustomBackgoundContainer(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'dark mode',
                          style: TextStyle(fontSize: 18),
                        ),
                        RotatedBox(
                            quarterTurns: 2,
                            child: Icon(Icons.arrow_back_ios_new_outlined))
                      ],
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                CustomBackgoundContainer(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Log out',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

