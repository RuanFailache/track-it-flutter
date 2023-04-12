import 'package:track_it/domain/domain.dart';

abstract class UserAuthenticationUsecase {
  Future<UserCredentialsEntity> signIn({
    required String email,
    required String password,
  });

  Future<UserCredentialsEntity> signUp({
    required String fullName,
    required String email,
    required String password,
  });

  Future<void> logOut();
}
