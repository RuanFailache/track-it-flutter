import 'package:track_it/data/repositories/user_authentication/temporary_user_authentication_repository.dart';
import 'package:track_it/presentation/presentation.dart';
import 'package:track_it/views/views.dart';

SignUpPresenter makeSignUpPresenter() {
  const form = SignUpForm.initial();
  const userAuthenticationRepository = TemporaryUserAuthenticationRepository();

  return GetSignUpPresenter(
    form: form,
    userAuthenticationRepository: userAuthenticationRepository,
  );
}
