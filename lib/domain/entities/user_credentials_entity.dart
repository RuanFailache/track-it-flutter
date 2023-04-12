import 'package:equatable/equatable.dart';

class UserCredentialsEntity extends Equatable {
  const UserCredentialsEntity({
    required this.accessToken,
    required this.refreshToken,
  });

  final String accessToken;

  final String refreshToken;

  @override
  List get props => [accessToken, refreshToken];
}
