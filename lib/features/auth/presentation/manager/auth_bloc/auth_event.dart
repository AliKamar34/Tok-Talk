part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LogInEvent extends AuthEvent {
  final String email;
  final String password;

  LogInEvent({required this.email, required this.password});
}

class RegisterEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;

  RegisterEvent({required this.email, required this.password, required this.name});

}