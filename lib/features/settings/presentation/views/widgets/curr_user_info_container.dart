import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/features/settings/data/repos/settings_repo_impl.dart';
import 'package:new_project/features/settings/presentation/manager/setting_cubit/settings_cubit.dart';
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
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return BlocProvider(
                  create: (context) => SettingsCubit(SettingRepoImpl()),
                  child: const CustomBottomSheet(),
                );
              },
            );
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
}
