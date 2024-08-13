import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/features/settings/data/repos/settings_repo_impl.dart';
import 'package:new_project/features/settings/presentation/manager/cubit/settings_cubit.dart';
import 'package:new_project/features/settings/presentation/views/widgets/cusotm_setting_app_bar.dart';
import 'package:new_project/features/settings/presentation/views/widgets/settings_view_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(SettingRepoImpl()),
      child: const Scaffold(
        body: Column(
          children: [
            CustomSettingAppBar(),
            Expanded(child: SettingsViewBody()),
          ],
        ),
      ),
    );
  }
}
