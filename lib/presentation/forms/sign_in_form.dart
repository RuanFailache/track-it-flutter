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

  final PasswordInput passwordInput;

  String get email => emailInput.value;

  String get password => passwordInput.value;

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
