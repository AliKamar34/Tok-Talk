part of 'change_send_icon_cubit.dart';

sealed class ChangeSendIconState extends Equatable {
  const ChangeSendIconState();

  @override
  List<Object> get props => [];
}

final class ChangeSendIconInitial extends ChangeSendIconState {}
final class ChangeSendIconRecord extends ChangeSendIconState {}
final class ChangeSendIconIText extends ChangeSendIconState {}
