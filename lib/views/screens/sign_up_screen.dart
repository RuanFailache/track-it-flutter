import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:track_it/app/config/routes.dart';

import '../widgets/widgets.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScreenLayout(
      title: 'TrackIt',
      subtitle: 'Sign up',
      formFields: [
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Full name',
            prefixIcon: Icon(Icons.face),
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Email',
            prefixIcon: Icon(Icons.alternate_email),
          ),
        ),
        PasswordFormField(
          focusNode: FocusNode(),
          decoration: const InputDecoration(
            hintText: 'Password',
            prefixIcon: Icon(Icons.lock_outline),
          ),
        ),
        PasswordFormField(
          focusNode: FocusNode(),
          decoration: const InputDecoration(
            hintText: 'Re-enter Password',
            prefixIcon: Icon(Icons.lock_outline),
          ),
        ),
      ],
      button: ElevatedButton(
        onPressed: () {},
        child: const Text('Create an account'),
      ),
      link: TextWithLinkAtEnd(
        text: 'Already have an account?',
        linkText: 'Login',
        onLinkPressed: () => context.pushReplacementNamed(kRouteNameSignIn),
      ),
    );
  }
}