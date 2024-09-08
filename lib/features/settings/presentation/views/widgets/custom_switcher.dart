
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/core/utils/colors_data.dart';
import 'package:new_project/core/utils/contant.dart';
import 'package:new_project/features/settings/data/models/enums/colors_enums.dart';
import 'package:new_project/features/settings/data/models/enums/theme_enums.dart';
import 'package:new_project/features/settings/presentation/manager/theme_cubit/theme_cubit.dart';
import 'package:switcher/core/switcher_size.dart';
import 'package:switcher/switcher.dart';

class CustomSwitcher extends StatelessWidget {
  const CustomSwitcher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool value = sharedPrefrence!.getString('theme')== 'd';
    return Switcher(
      value: value,
      size: SwitcherSize.medium,
      switcherButtonRadius: 50,
      enabledSwitcherButtonRotate: true,
      iconOff: Icons.sunny,
      iconOn: Icons.nights_stay_rounded,
      colorOff: Colors.blueGrey.withOpacity(0.3),
      colorOn:colorAssetData(context,ColorEnum.scaffoldColor),
      onChanged: (bool state) {
        value = state;
        
        if (value == true) {
          BlocProvider.of<ThemeCubit>(context).changeTheme(ThemeEnum.dark);
        } else {
          BlocProvider.of<ThemeCubit>(context).changeTheme(ThemeEnum.light);
        }
      },
    );
  }
}
