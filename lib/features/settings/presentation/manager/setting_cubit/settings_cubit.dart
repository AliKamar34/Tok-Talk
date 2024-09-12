import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/features/settings/data/repos/settings_repo.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this.settingsRepo) : super(SettingsInitial());
  final SettingsRepo settingsRepo;

  Future<void> updateImage() async {
    emit(SettingsLoading());
    var result = await settingsRepo.upLoadImage();
 result.fold((failuer) {
      emit(SettingsFailuer(errMessage: failuer.errorMessage));
    }, (_) {
      emit(SettingsSuccess());
    });
  }
}
