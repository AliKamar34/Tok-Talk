import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:new_project/features/auth/data/repos/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;
  AuthBloc(this.authRepo) : super(AuthInitial()) {
    on<AuthEvent>(
      (event, emit) {
        if (event is LogInEvent) {
          emit(LogInLoading());
          try {
            authRepo.logInUser(
              email: event.email,
              password: event.password,
            );
            emit(LogInSuccess());
          } on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
              emit(LogInFailuer(errMessage: 'No user found for that email'));
            } else if (e.code == 'wrong-password') {
              emit(LogInFailuer(errMessage: 'Wrong password'));
            } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
              emit(LogInFailuer(errMessage: 'email or password is wrong'));
            } else if (e.code == 'too-many-requests') {
              emit(LogInFailuer(
                  errMessage: 'too many requests , please try again later'));
            }
          } catch (e) {
            emit(LogInFailuer(errMessage: e.toString()));
          }
        } else if (event is RegisterEvent) {
          emit(RegisterLoading());
          try {
            authRepo.registerUser(
              email: event.email,
              name: event.name,
              password: event.password,
            );
            emit(RegisterSuccess());
          } on FirebaseAuthException catch (e) {
            if (e.code == 'weak-password') {
              emit(RegisterFailuer(errMessage: 'Weak password'));
            } else if (e.code == 'email-already-in-use') {
              emit(RegisterFailuer(errMessage: 'Email already in use'));
            }
          } catch (e) {
            emit(RegisterFailuer(errMessage: e.toString()));
          }
        }
      },
    );
  }
}
