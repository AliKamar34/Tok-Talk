part of 'settings_cubit.dart';

sealed class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

final class SettingsInitial extends SettingsState {}
final class SettingsLoading extends SettingsState {}
final class SettingsSuccess extends SettingsState {}
final class SettingsFailuer extends SettingsState {
   final String errMessage;

  const SettingsFailuer({required this.errMessage});
}


