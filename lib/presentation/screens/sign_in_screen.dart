import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:track_it/app/config/routes.dart';

import '../widgets/widgets.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScreenLayout(
      title: 'TrackIt',
      subtitle: 'Login',
      formFields: [
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Email',
            prefixIcon: Icon(Icons.alternate_email),
          ),
        ),
        PasswordFormField(
          hintText: 'Password',
          focusNode: FocusNode(),
          prefixIcon: Icons.lock_outline,
        ),
      ],
      button: ElevatedButton(
        onPressed: () {},
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
