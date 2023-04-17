import 'package:track_it/data/data.dart';
import 'package:track_it/data/models/models.dart';
import 'package:track_it/domain/domain.dart';

class RemoteUserAuthenticationRepository extends UserAuthenticationRepository {
  RemoteUserAuthenticationRepository({
    required this.url,
    required this.httpClient,
  });

  final String url;

  final HttpClient httpClient;

  @override
  Future<void> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<UserCredentialsEntity> signIn({
    required String email,
    required String password,
  }) async {
    final body = {
      'email': email,
      'password': password,
    };

    try {
      final httpClientResponse = await httpClient.request(
        url: '$url/auth/sign-in',
        body: body,
        method: HttpMethod.post,
      );

      if (httpClientResponse == null) throw HttpError.serverError;

      return RemoteUserCredentialsModel.fromJson(httpClientResponse).toEntity();
    } on HttpError catch (err) {
      throw err == HttpError.unauthorized
          ? UserAuthenticationError.invalidCredentials
          : UserAuthenticationError.unknown;
    }
  }

  @override
  Future<UserCredentialsEntity> signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    final body = {
      'email': email,
      'fullName': fullName,
      'password': password,
    };

    try {
      final httpClientResponse = await httpClient.request(
        url: '$url/auth/sign-up',
        body: body,
        method: HttpMethod.post,
      );

      if (httpClientResponse == null) throw HttpError.serverError;

      return RemoteUserCredentialsModel.fromJson(httpClientResponse).toEntity();
    } on HttpError catch (err) {
      throw err == HttpError.unauthorized
          ? UserAuthenticationError.invalidCredentials
          : UserAuthenticationError.unknown;
    }
  }
}
