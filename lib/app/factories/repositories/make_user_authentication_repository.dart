import 'package:track_it/app/factories/adapters/make_http_client_adapter.dart';
import 'package:track_it/data/repositories/user_authentication/remote_user_authentication_repository.dart';
import 'package:track_it/domain/domain.dart';

import '../factories.dart';

UserAuthenticationRepository makeUserAuthenticationRepository() {
  final apiUrl = makeApiUrl();
  final httpClient = makeHttpClientAdapter();

  return RemoteUserAuthenticationRepository(
    url: apiUrl,
    httpClient: httpClient,
  );
}
