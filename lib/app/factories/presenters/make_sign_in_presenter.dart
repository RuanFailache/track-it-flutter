import 'package:track_it/app/factories/factories.dart';
import 'package:track_it/presentation/presentation.dart';
import 'package:track_it/views/views.dart';

SignInPresenter makeSignInPresenter() {
  const form = SignInForm.initial();
  final userAuthenticationRepository = makeUserAuthenticationRepository();

  return GetSignInPresenter(
    form: form,
    userAuthenticationRepository: userAuthenticationRepository,
  );
}
