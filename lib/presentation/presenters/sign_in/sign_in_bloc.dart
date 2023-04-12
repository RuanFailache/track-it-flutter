import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:track_it/domain/domain.dart';
import 'package:track_it/presentation/presentation.dart';

import 'sign_in.dart';

class SignInBloc extends Cubit<SignInState> {
  SignInBloc({
    required UserAuthenticationUsecase userAuthenticationUsecase,
  })  : _userAuthenticationUsecase = userAuthenticationUsecase,
        super(const SignInState.initial());

  final UserAuthenticationUsecase _userAuthenticationUsecase;

  void emailInputChanged(String email) {
    emit(
      state.copyWith(
        form: state.form.copyWith(
          emailInput: EmailInput.dirty(email),
        ),
      ),
    );
  }

  void passwordInputChanged(String password) {
    emit(
      state.copyWith(
        form: state.form.copyWith(
          passwordInput: PasswordInput.dirty(password),
        ),
      ),
    );
  }

  Future<void> submitForm() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      final userCredentials = await _userAuthenticationUsecase.signIn(
        email: state.form.emailInput.value,
        password: state.form.passwordInput.value,
      );
      emit(
        state.copyWith(
          userCredentials: userCredentials,
          status: FormzSubmissionStatus.success,
        ),
      );
    } catch (err) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
