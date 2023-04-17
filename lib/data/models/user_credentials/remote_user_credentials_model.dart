import 'package:track_it/data/data.dart';
import 'package:track_it/domain/domain.dart';

class RemoteUserCredentialsModel {
  const RemoteUserCredentialsModel({
    required this.accessToken,
    required this.refreshToken,
  });

  final String accessToken;

  final String refreshToken;

  factory RemoteUserCredentialsModel.fromJson(Map json) {
    if (json.containsKey('accessToken') && json.containsKey('refreshToken')) {
      return RemoteUserCredentialsModel(
        accessToken: json['accessToken'],
        refreshToken: json['refreshToken'],
      );
    }
    throw HttpError.invalidData;
  }

  UserCredentialsEntity toEntity() {
    return UserCredentialsEntity(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}
