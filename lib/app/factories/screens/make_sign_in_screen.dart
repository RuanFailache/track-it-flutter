import 'package:track_it/views/views.dart';

import '../factories.dart';

SignInScreen makeSignInScreen() {
  final presenter = makeSignInPresenter();

  return SignInScreen(presenter: presenter);
}
