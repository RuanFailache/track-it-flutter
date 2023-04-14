import 'package:formz/formz.dart';

enum EmailInputError { empty, invalid }

extension EmailInputErrorDescription on EmailInputError {
  String get description {
    switch (this) {
      case EmailInputError.empty:
        return 'Email should not be empty';
      case EmailInputError.invalid:
        return 'Must be a valid email';
    }
  }
}

class EmailInput extends FormzInput<String, EmailInputError?> {
  const EmailInput.pure() : super.pure('');

  const EmailInput.dirty(super.value) : super.dirty();

  @override
  EmailInputError? validator(String value) {
    if (value.isEmpty) return EmailInputError.empty;
    final regexp = RegExp(r'^[a-z\d.]+@[a-z\d]+\.[a-z]+(\.[a-z]+)?$');
    if (!regexp.hasMatch(value)) return EmailInputError.invalid;
    return null;
  }
}
