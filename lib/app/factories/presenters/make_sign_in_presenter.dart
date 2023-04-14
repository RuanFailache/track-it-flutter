import 'package:track_it/data/repositories/user_authentication/temporary_user_authentication_repository.dart';
import 'package:track_it/presentation/presentation.dart';
import 'package:track_it/views/presenters/sign_in_presenter.dart';

SignInPresenter makeSignInPresenter() {
  const form = SignInForm.initial();
  const userAuthenticationRepository = TemporaryUserAuthenticationRepository();

  return GetSignInPresenter(
    form: form,
    userAuthenticationRepository: userAuthenticationRepository,
  );
}
