import 'package:formz/formz.dart';
import 'package:get/get.dart';
import 'package:track_it/domain/domain.dart';
import 'package:track_it/presentation/inputs/required_input.dart';
import 'package:track_it/presentation/presentation.dart';
import 'package:track_it/views/views.dart';

class GetSignUpPresenter implements SignUpPresenter {
  GetSignUpPresenter({
    required SignUpForm form,
    required UserAuthenticationRepository userAuthenticationRepository,
  })  : _form = form,
        _userAuthenticationRepository = userAuthenticationRepository;

  SignUpForm _form;

  final UserAuthenticationRepository _userAuthenticationRepository;

  final _fullNameError = RxnString();

  final _emailError = RxnString();

  final _passwordError = RxnString();

  final _confirmPasswordError = RxnString();

  final _formError = RxnString();

  final _submissionStatus = Rx(FormzSubmissionStatus.initial);

  final _canSubmit = RxBool(false);

  void _validateForm() {
    _canSubmit.value = _form.isDirty &&
        _form.isValid &&
        _submissionStatus.value != FormzSubmissionStatus.inProgress;
  }

  @override
  Stream<String?> get fullNameErrorStream => _fullNameError.stream;

  @override
  Stream<String?> get emailErrorStream => _emailError.stream;

  @override
  Stream<String?> get passwordErrorStream => _passwordError.stream;

  @override
  Stream<String?> get confirmPasswordErrorStream => _confirmPasswordError.stream;

  @override
  Stream<String?> get formErrorStream => _formError.stream;

  @override
  Stream<FormzSubmissionStatus> get submissionStatusStream => _submissionStatus.stream;

  @override
  Stream<bool> get canSubmitStream => _canSubmit.stream;

  @override
  void fullNameInputChanged(String email) {
    final fullNameInput = RequiredInput.dirty(email);
    _form = _form.copyWith(fullNameInput: fullNameInput);
    _fullNameError.value = _form.fullNameError;
    _validateForm();
  }

  @override
  void emailInputChanged(String email) {
    final emailInput = EmailInput.dirty(email);
    _form = _form.copyWith(emailInput: emailInput);
    _emailError.value = _form.emailError;
    _validateForm();
  }

  @override
  void passwordInputChanged(String password) {
    final passwordInput = PasswordInput.dirty(password);
    _form = _form.copyWith(passwordInput: passwordInput);
    _passwordError.value = _form.passwordError;
    _validateForm();
  }

  @override
  void confirmPasswordInputChanged(String confirmPassword) {
    final confirmPasswordInput = RequiredInput.dirty(confirmPassword);
    _form = _form.copyWith(confirmPasswordInput: confirmPasswordInput);
    _confirmPasswordError.value = _form.confirmPasswordError;
    _validateForm();
  }

  @override
  Future<void> submitForm() async {
    if (!_canSubmit.value) return;

    _formError.value = null;

    if (_form.passwordInput.value != _form.confirmPasswordInput.value) {
      _formError.value = 'Oops! It looks like the passwords you entered'
          ' does not match. Please try again';
      return;
    }

    _canSubmit.value = false;
    _submissionStatus.value = FormzSubmissionStatus.inProgress;

    try {
      await _userAuthenticationRepository.signUp(
        fullName: _form.fullNameInput.value,
        email: _form.emailInput.value,
        password: _form.passwordInput.value,
      );

      _submissionStatus.value = FormzSubmissionStatus.success;
    } catch (err) {
      if (err == UserAuthenticationError.invalidCredentials) {
        _formError.value = 'Invalid credentials provided';
      }
      if (err == UserAuthenticationError.unknown) {
        _formError.value = 'Unknown error occurred. Please try again or contact us';
      }
      _submissionStatus.value = FormzSubmissionStatus.failure;
    }

    _validateForm();
  }
}
