import 'package:formz/formz.dart';
import 'package:track_it/presentation/presentation.dart';

class SignInForm with FormzMixin {
  const SignInForm({
    required this.emailInput,
    required this.passwordInput,
  });

  const SignInForm.initial()
      : emailInput = const EmailInput.pure(),
        passwordInput = const PasswordInput.pure();

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

  final PasswordInput passwordInput;

  String? get passwordError {
    switch (passwordInput.error) {
      case PasswordInputError.empty:
        return 'Password must not be empty';
      case PasswordInputError.invalid:
        return 'Must be a valid password';
      default:
        return null;
    }
  }

  SignInForm copyWith({
    EmailInput? emailInput,
    PasswordInput? passwordInput,
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
