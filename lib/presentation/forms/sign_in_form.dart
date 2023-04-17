import 'package:formz/formz.dart';
import 'package:track_it/presentation/inputs/required_input.dart';
import 'package:track_it/presentation/presentation.dart';

class SignInForm with FormzMixin {
  const SignInForm({
    required this.emailInput,
    required this.passwordInput,
  });

  const SignInForm.initial()
      : emailInput = const EmailInput.pure(),
        passwordInput = const RequiredInput.pure();

  final EmailInput emailInput;

  String? get emailError {
    switch (emailInput.error) {
      case EmailInputError.empty:
        return 'Email must not be empty';
      case EmailInputError.invalid:
        return 'Must be a valid email';
      default:
        return null;
    }
  }

  final RequiredInput passwordInput;

  String? get passwordError {
    switch (passwordInput.error) {
      case RequiredInputError.empty:
        return 'Password must not be empty';
      default:
        return null;
    }
  }

  SignInForm copyWith({
    EmailInput? emailInput,
    RequiredInput? passwordInput,
  }) =>
      SignInForm(
        emailInput: emailInput ?? this.emailInput,
        passwordInput: passwordInput ?? this.passwordInput,
      );

  @override
  List<FormzInput> get inputs => [
        emailInput,
        passwordInput,
      ];
}
