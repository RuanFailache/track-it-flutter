import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:track_it/domain/domain.dart';
import 'package:track_it/presentation/presenters/sign_in/sign_in.dart';

class SignInState extends Equatable {
  const SignInState({
    required this.form,
    required this.status,
    this.userCredentials,
  });

  const SignInState.initial()
      : userCredentials = null,
        form = const SignInForm.initial(),
        status = FormzSubmissionStatus.initial;

  final SignInForm form;

  final FormzSubmissionStatus status;

  final UserCredentialsEntity? userCredentials;

  SignInState copyWith({
    SignInForm? form,
    FormzSubmissionStatus? status,
    UserCredentialsEntity? userCredentials,
  }) =>
      SignInState(
        form: form ?? this.form,
        status: status ?? this.status,
        userCredentials: userCredentials ?? this.userCredentials,
      );

  @override
  List get props => [status, form];
}
