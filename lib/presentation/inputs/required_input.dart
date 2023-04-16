import 'package:formz/formz.dart';

enum RequiredInputError { empty }

class RequiredInput extends FormzInput<String, RequiredInputError?> {
  const RequiredInput.pure() : super.pure('');

  const RequiredInput.dirty(super.value) : super.dirty();

  @override
  RequiredInputError? validator(String value) {
    if (value.isEmpty) return RequiredInputError.empty;
    return null;
  }
}
