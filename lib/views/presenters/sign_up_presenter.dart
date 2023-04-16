import 'package:formz/formz.dart';

abstract class SignUpPresenter {
  Stream<String?> get fullNameErrorStream;

  Stream<String?> get emailErrorStream;

  Stream<String?> get passwordErrorStream;

  Stream<String?> get confirmPasswordErrorStream;

  Stream<String?> get formErrorStream;

  Stream<FormzSubmissionStatus> get submissionStatusStream;

  Stream<bool> get canSubmitStream;

  void fullNameInputChanged(String fullName);

  void emailInputChanged(String email);

  void passwordInputChanged(String password);

  void confirmPasswordInputChanged(String confirmPassword);

  Future<void> submitForm();
}
