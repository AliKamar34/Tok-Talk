import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/core/utils/contant.dart';
import 'package:new_project/features/settings/data/models/enums/theme_enums.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  changeTheme(ThemeEnum theme) {
    switch (theme) {
      case ThemeEnum.initial:
        if (sharedPrefrence!.getString('theme') != null) {
          if (sharedPrefrence!.getString('theme') == 'l') {
            emit(ThemeLight());
          } else {
            emit(ThemeDark()); 
          }
        }
        break;
      case ThemeEnum.light:
        sharedPrefrence!.setString('theme', 'l');
        emit(ThemeLight());
        break;
      case ThemeEnum.dark:
        sharedPrefrence!.setString('theme', 'd');
        emit(ThemeDark());
        break;
    }
  }
}
