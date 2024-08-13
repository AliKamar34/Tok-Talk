import 'package:flutter/material.dart';
import 'package:new_project/features/settings/presentation/views/widgets/cusotm_setting_app_bar.dart';
import 'package:new_project/features/settings/presentation/views/widgets/settings_view_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomSettingAppBar(),
          Expanded(child: SettingsViewBody()),
        ],
      ),
    );
  }
}
