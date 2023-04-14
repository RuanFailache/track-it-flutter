import 'package:formz/formz.dart';

abstract class SignInPresenter {
  Stream<String?> get emailErrorStream;

  Stream<String?> get passwordErrorStream;

  Stream<String?> get formErrorStream;

  Stream<FormzSubmissionStatus> get submissionStatusStream;

  bool get canSubmit;

  void emailInputChanged(String email);

  void passwordInputChanged(String password);

  Future<void> submitForm();
}
