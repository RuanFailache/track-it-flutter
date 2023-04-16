import 'package:formz/formz.dart';
import 'package:track_it/presentation/inputs/required_input.dart';
import 'package:track_it/presentation/presentation.dart';

class SignUpForm with FormzMixin {
  const SignUpForm({
    required this.emailInput,
    required this.fullNameInput,
    required this.passwordInput,
    required this.confirmPasswordInput,
  });

  const SignUpForm.initial()
      : fullNameInput = const RequiredInput.pure(),
        emailInput = const EmailInput.pure(),
        passwordInput = const PasswordInput.pure(),
        confirmPasswordInput = const PasswordInput.pure();

  final RequiredInput fullNameInput;

  String get fullName => emailInput.value;

  String? get fullNameError {
    switch (fullNameInput.error) {
      case RequiredInputError.empty:
        return 'Full name must not be empty';
      default:
        return null;
    }
  }

  final EmailInput emailInput;

  String get email => emailInput.value;

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

  String get password => passwordInput.value;

  String? get passwordError {
    switch (passwordInput.error) {
      case PasswordInputError.empty:
        return 'Password must not be empty';
      case PasswordInputError.invalid:
        return 'Must contain at least 6 characters';
      default:
        return null;
    }
  }

  final PasswordInput confirmPasswordInput;

  String get confirmPassword => passwordInput.value;

  String? get confirmPasswordError {
    switch (passwordInput.error) {
      case PasswordInputError.empty:
        return 'Password must not be empty';
      case PasswordInputError.invalid:
        return 'Must contain at least 6 characters';
      default:
        return null;
    }
  }

  SignUpForm copyWith({
    RequiredInput? fullNameInput,
    EmailInput? emailInput,
    PasswordInput? passwordInput,
    PasswordInput? confirmPasswordInput,
  }) =>
      SignUpForm(
        fullNameInput: fullNameInput ?? this.fullNameInput,
        emailInput: emailInput ?? this.emailInput,
        passwordInput: passwordInput ?? this.passwordInput,
        confirmPasswordInput: confirmPasswordInput ?? this.confirmPasswordInput,
      );

  @override
  List<FormzInput> get inputs => [
        fullNameInput,
        passwordInput,
        passwordInput,
        confirmPasswordInput,
      ];
}
