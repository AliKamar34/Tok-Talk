part of 'auth_bloc.dart';

abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class LogInLoading extends AuthState {}

final class LogInSuccess extends AuthState {}

final class LogInFailuer extends AuthState {
  final String errMessage;

  LogInFailuer({required this.errMessage});
}

final class RegisterLoading extends AuthState {}

final class RegisterSuccess extends AuthState {}

final class RegisterFailuer extends AuthState {
  final String errMessage;

  RegisterFailuer({required this.errMessage});
}
