import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
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
        StreamBuilder<FormzSubmissionStatus>(
          stream: presenter.submissionStatusStream,
          builder: (context, submissionStatus) {
            return StreamBuilder<String?>(
              stream: presenter.emailErrorStream,
              builder: (context, emailError) {
                return TextFormField(
                  readOnly: submissionStatus.data?.isInProgress == true,
                  onChanged: presenter.emailInputChanged,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    errorText: emailError.data,
                    prefixIcon: const Icon(Icons.alternate_email),
                  ),
                );
              },
            );
          },
        ),
        StreamBuilder<FormzSubmissionStatus>(
          stream: presenter.submissionStatusStream,
          builder: (context, submissionStatus) {
            return StreamBuilder<String?>(
              stream: presenter.passwordErrorStream,
              builder: (context, passwordError) {
                return PasswordFormField(
                  readOnly: submissionStatus.data?.isInProgress == true,
                  focusNode: passwordFocusNode,
                  onChanged: presenter.passwordInputChanged,
                  onFieldSubmitted: (_) => presenter.submitForm(),
                  decoration: InputDecoration(
                    hintText: 'Password',
                    errorText: passwordError.data,
                    prefixIcon: const Icon(Icons.lock_outline),
                  ),
                );
              },
            );
          },
        ),
      ],
      button: StreamBuilder<FormzSubmissionStatus>(
        stream: presenter.submissionStatusStream,
        builder: (context, submissionStatus) {
          return StreamBuilder<bool>(
            stream: presenter.canSubmitStream,
            builder: (context, canSubmit) {
              return ElevatedButton(
                onPressed: canSubmit.data == true ? presenter.submitForm : null,
                child: submissionStatus.data?.isInProgress == true
                    ? SizedBox.fromSize(
                        size: const Size(16, 16),
                        child: const CircularProgressIndicator(
                          color: Color(0xFF979797),
                        ),
                      )
                    : const Text('Login'),
              );
            },
          );
        },
      ),
      link: TextWithLinkAtEnd(
        text: 'Don\'t have an account yet?',
        linkText: 'Register now',
        onLinkPressed: () => context.pushReplacementNamed(kRouteNameSignUp),
      ),
    );
  }
}
