import 'package:formz/formz.dart';
import 'package:get/get.dart';
import 'package:track_it/domain/domain.dart';
import 'package:track_it/presentation/presentation.dart';
import 'package:track_it/views/views.dart';

class GetSignInPresenter implements SignInPresenter {
  GetSignInPresenter({
    required SignInForm form,
    required UserAuthenticationRepository userAuthenticationRepository,
  })  : _form = form,
        _userAuthenticationRepository = userAuthenticationRepository;

  SignInForm _form;

  final UserAuthenticationRepository _userAuthenticationRepository;

  final _emailError = RxnString();

  final _passwordError = RxnString();

  final _formError = RxnString();

  final _submissionStatus = Rx(FormzSubmissionStatus.initial);

  final _canSubmit = RxBool(false);

  void _validateForm() {
    _canSubmit.value = _form.isDirty &&
        _form.isValid &&
        _submissionStatus.value != FormzSubmissionStatus.inProgress;
  }

  @override
  Stream<String?> get emailErrorStream => _emailError.stream;

  @override
  Stream<String?> get passwordErrorStream => _passwordError.stream;

  @override
  Stream<String?> get formErrorStream => _formError.stream;

  @override
  Stream<FormzSubmissionStatus> get submissionStatusStream => _submissionStatus.stream;

  @override
  Stream<bool> get canSubmitStream => _canSubmit.stream;

  @override
  void emailInputChanged(String email) {
    final emailInput = EmailInput.dirty(email);
    _emailError.value = emailInput.error?.description;
    _form = _form.copyWith(emailInput: emailInput);
    _validateForm();
  }

  @override
  void passwordInputChanged(String password) {
    final passwordInput = PasswordInput.dirty(password);
    _passwordError.value = passwordInput.error?.description;
    _form = _form.copyWith(passwordInput: passwordInput);
    _validateForm();
  }

  @override
  Future<void> submitForm() async {
    _canSubmit.value = false;
    _submissionStatus.value = FormzSubmissionStatus.inProgress;

    try {
      await _userAuthenticationRepository.signIn(
        email: _form.email,
        password: _form.password,
      );

      _submissionStatus.value = FormzSubmissionStatus.success;
    } catch (err) {
      _submissionStatus.value = FormzSubmissionStatus.failure;
    }

    _validateForm();
  }
}
