import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/core/widgets/custom_backgtound_container.dart';
import 'package:new_project/core/widgets/custom_loading_indicator.dart';
import 'package:new_project/features/settings/presentation/manager/setting_cubit/settings_cubit.dart';

class ChangeProfileImageButton extends StatelessWidget {
  const ChangeProfileImageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBackgoundContainer(
      onPressed: () {
        BlocProvider.of<SettingsCubit>(context).updateImage();
      },
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          if (state is SettingsLoading) {
            return const FittedBox(
              fit: BoxFit.scaleDown,
              child: SizedBox(
                height: 20,
                child: CustomLoadingIndicator(),
              ),
            );
          } else if (state is SettingsSuccess) {
            return const Padding(
              padding: EdgeInsets.all(12),
              child: Text('success'),
            );
          } else {
            return const Padding(
              padding: EdgeInsets.all(12),
              child: Text('Change Photo'),
            );
          }
        },
      ),
    );
  }
}