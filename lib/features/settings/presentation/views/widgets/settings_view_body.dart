import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/core/widgets/custom_backgtound_container.dart';
import 'package:new_project/features/home/presentation/views/widgets/custom_cirlce_image.dart';
import 'package:new_project/features/settings/presentation/manager/setting_cubit/settings_cubit.dart';
import 'package:new_project/features/settings/presentation/views/widgets/curr_user_info_container.dart';
import 'package:new_project/features/settings/presentation/views/widgets/custom_switcher.dart';

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
                const SizedBox(
                  height: 20,
                ),
                CustomBackgoundContainer(
                  onPressed: () {
                    BlocProvider.of<SettingsCubit>(context).updateImage();
                    // .settingsRepo
                    // .upLoadImage();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text('Change Photo'),
                  ),
                ),
                const CurrUserInfo(),
                CustomBackgoundContainer(
                  onPressed: (){},
                  child: const Padding(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'dark mode',
                          style: TextStyle(fontSize: 18),
                        ),
                        CustomSwitcher(),
                      ],
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                CustomBackgoundContainer(
                  onPressed: () {
                    BlocProvider.of<SettingsCubit>(context)
                        .settingsRepo
                        .logOutUser(context: context);
                  },
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
