import 'package:track_it/views/views.dart';

import '../presenters/make_sign_in_presenter.dart';

SignInScreen makeSignInScreen() {
  final presenter = makeSignInPresenter();

  return SignInScreen(presenter: presenter);
}
