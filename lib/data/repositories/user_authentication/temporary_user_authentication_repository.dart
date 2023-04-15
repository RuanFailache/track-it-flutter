import 'package:track_it/domain/domain.dart';

class TemporaryUserAuthenticationRepository implements UserAuthenticationRepository {
  const TemporaryUserAuthenticationRepository();

  @override
  Future<void> logOut() async {}

  @override
  Future<UserCredentialsEntity> signIn({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 2));
    return const UserCredentialsEntity(accessToken: '', refreshToken: '');
  }

  @override
  Future<UserCredentialsEntity> signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    return const UserCredentialsEntity(accessToken: '', refreshToken: '');
  }
}
