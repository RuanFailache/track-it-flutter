import 'package:track_it/data/data.dart';
import 'package:track_it/domain/domain.dart';

class RemoteUserCredentialsModel {
  const RemoteUserCredentialsModel({
    required this.accessToken,
  });

  final String accessToken;

  factory RemoteUserCredentialsModel.fromJson(Map json) {
    if (json.containsKey('accessToken')) {
      return RemoteUserCredentialsModel(
        accessToken: json['accessToken'],
      );
    }
    throw HttpError.invalidData;
  }

  UserCredentialsEntity toEntity() {
    return UserCredentialsEntity(
      accessToken: accessToken,
    );
  }
}
