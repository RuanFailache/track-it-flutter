import 'package:flutter/material.dart';
import 'package:track_it/views/views.dart';

import '../factories.dart';

Widget makeSignUpScreen() {
  final presenter = makeSignUpPresenter();

  return SignUpScreen(presenter: presenter);
}
