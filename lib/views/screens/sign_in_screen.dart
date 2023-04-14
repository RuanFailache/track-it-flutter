import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:track_it/app/config/routes.dart';
import 'package:track_it/views/views.dart';

import '../widgets/widgets.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({
    super.key,
    required this.presenter,
  });

  final SignInPresenter presenter;

  @override
  Widget build(BuildContext context) {
    final passwordFocusNode = FocusNode();

    return AuthScreenLayout(
      title: 'TrackIt',
      subtitle: 'Login',
      formFields: [
        StreamBuilder<String?>(
          stream: presenter.emailErrorStream,
          builder: (context, snapshot) {
            return TextFormField(
              onChanged: presenter.emailInputChanged,
              decoration: InputDecoration(
                hintText: 'Email',
                errorText: snapshot.data,
                prefixIcon: const Icon(Icons.alternate_email),
              ),
            );
          },
        ),
        StreamBuilder<String?>(
          stream: presenter.passwordErrorStream,
          builder: (context, snapshot) {
            return PasswordFormField(
              focusNode: passwordFocusNode,
              onChanged: presenter.passwordInputChanged,
              decoration: InputDecoration(
                hintText: 'Password',
                errorText: snapshot.data,
                prefixIcon: const Icon(Icons.lock_outline),
              ),
            );
          },
        ),
      ],
      button: ElevatedButton(
        onPressed: () => presenter.submitForm,
        child: const Text('Login'),
      ),
      link: TextWithLinkAtEnd(
        text: 'Don\'t have an account yet?',
        linkText: 'Register now',
        onLinkPressed: () => context.pushReplacementNamed(kRouteNameSignUp),
      ),
    );
  }
}
