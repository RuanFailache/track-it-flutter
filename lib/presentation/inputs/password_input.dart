import 'package:formz/formz.dart';

enum PasswordInputError { empty, invalid }

extension PasswordInputErrorDescription on PasswordInputError {
  String get description {
    switch (this) {
      case PasswordInputError.empty:
        return 'Password should not be empty';
      case PasswordInputError.invalid:
        return 'Must contain at least 6 digits';
    }
  }
}

class PasswordInput extends FormzInput<String, PasswordInputError?> {
  const PasswordInput.pure() : super.pure('');

  const PasswordInput.dirty(super.value) : super.dirty();

  @override
  PasswordInputError? validator(String value) {
    if (value.isEmpty) return PasswordInputError.empty;
    if (value.length < 6) return PasswordInputError.invalid;
    return null;
  }
}
