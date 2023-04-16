import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:track_it/app/config/routes.dart';
import 'package:track_it/views/presenters/sign_up_presenter.dart';

import '../widgets/widgets.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({
    super.key,
    required this.presenter,
  });

  final SignUpPresenter presenter;

  @override
  Widget build(BuildContext context) {
    final passwordFocusNode = FocusNode();
    final confirmPasswordFocusNode = FocusNode();

    return AuthScreenLayout(
      title: 'TrackIt',
      subtitle: 'Sign up',
      formFields: [
        StreamBuilder<FormzSubmissionStatus>(
          stream: presenter.submissionStatusStream,
          builder: (context, submissionStatus) {
            return StreamBuilder<String?>(
              stream: presenter.fullNameErrorStream,
              builder: (context, fullNameError) {
                return TextFormField(
                  textInputAction: TextInputAction.next,
                  onChanged: presenter.fullNameInputChanged,
                  readOnly: submissionStatus.data?.isInProgress == true,
                  decoration: InputDecoration(
                    hintText: 'Full name',
                    errorText: fullNameError.data,
                    prefixIcon: const Icon(Icons.face),
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
              stream: presenter.emailErrorStream,
              builder: (context, emailError) {
                return TextFormField(
                  textInputAction: TextInputAction.next,
                  onChanged: presenter.emailInputChanged,
                  readOnly: submissionStatus.data == FormzSubmissionStatus.inProgress,
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
                  focusNode: passwordFocusNode,
                  textInputAction: TextInputAction.next,
                  onChanged: presenter.passwordInputChanged,
                  readOnly: submissionStatus.data?.isInProgress == true,
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
        StreamBuilder<FormzSubmissionStatus>(
          stream: presenter.submissionStatusStream,
          builder: (context, submissionStatus) {
            return StreamBuilder<String?>(
              stream: presenter.confirmPasswordErrorStream,
              builder: (context, confirmPasswordError) {
                return PasswordFormField(
                  focusNode: confirmPasswordFocusNode,
                  onFieldSubmitted: (_) => presenter.submitForm(),
                  onChanged: presenter.confirmPasswordInputChanged,
                  readOnly: submissionStatus.data?.isInProgress == true,
                  decoration: InputDecoration(
                    hintText: 'Re-enter password',
                    errorText: confirmPasswordError.data,
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
                    : const Text('Create an account'),
              );
            },
          );
        },
      ),
      link: TextWithLinkAtEnd(
        text: 'Already have an account?',
        linkText: 'Login',
        onLinkPressed: () => context.pushReplacementNamed(kRouteNameSignIn),
      ),
    );
  }
}
