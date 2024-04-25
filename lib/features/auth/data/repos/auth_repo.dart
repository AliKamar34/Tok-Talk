
abstract class AuthRepo {
  Future<void> logInUser({
    required String email,
    required String password,
  });
  Future<void> registerUser({
    required String email,
    required String password,
    required String name,
  });
}
