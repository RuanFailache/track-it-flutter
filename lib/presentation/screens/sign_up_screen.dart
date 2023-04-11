import 'package:flutter/material.dart';

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
          hintText: 'Password',
          prefixIcon: Icons.lock_outline,
        ),
        PasswordFormField(
          focusNode: FocusNode(),
          hintText: 'Re-enter password',
          prefixIcon: Icons.lock_outline,
        ),
      ],
      button: ElevatedButton(
        onPressed: () {},
        child: const Text('Create an account'),
      ),
      link: TextWithLinkAtEnd(
        text: 'Already have an account?',
        linkText: 'Login',
        onLinkPressed: () {},
      ),
    );
  }
}
