import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_project/features/auth/data/repos/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;
  AuthBloc(this.authRepo) : super(AuthInitial()) {
    on<AuthEvent>(
      (event, emit) async {
        if (event is LogInEvent) {
          emit(LogInLoading());
          var logingIn = await authRepo.logInUser(
              email: event.email, password: event.password);
          logingIn.fold(
            (failure) {
              emit(LogInFailuer(errMessage: failure.errorMessage));
            },
            (_) {
              emit(LogInSuccess());
            },
          );
        } else if (event is RegisterEvent) {
          emit(RegisterLoading());

          var registering = await authRepo.registerUser(
            email: event.email,
            name: event.name,
            password: event.password,
          );
          registering.fold(
            (failure) {
              emit(RegisterFailuer(errMessage: failure.errorMessage));
            },
            (_) {
              emit(RegisterSuccess());
            },
          );
        }
      },
    );
  }
}
