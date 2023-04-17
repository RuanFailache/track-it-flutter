import 'package:track_it/presentation/presentation.dart';
import 'package:track_it/views/views.dart';

import '../factories.dart';

SignUpPresenter makeSignUpPresenter() {
  const form = SignUpForm.initial();
  final userAuthenticationRepository = makeUserAuthenticationRepository();

  return GetSignUpPresenter(
    form: form,
    userAuthenticationRepository: userAuthenticationRepository,
  );
}
