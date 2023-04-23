import 'package:equatable/equatable.dart';

class UserCredentialsEntity extends Equatable {
  const UserCredentialsEntity({
    required this.accessToken,
  });

  final String accessToken;

  @override
  List get props => [accessToken];
}
