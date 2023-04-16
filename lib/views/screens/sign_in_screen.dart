import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:track_it/app/config/routes.dart';
import 'package:track_it/views/views.dart';

import '../widgets/widgets.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key, required this.presenter});

  final SignInPresenter presenter;

  Widget _buildEmailInput() {
    return StreamBuilder<FormzSubmissionStatus>(
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
    );
  }

  Widget _buildPasswordInput() {
    final passwordFocusNode = FocusNode();

    return StreamBuilder<FormzSubmissionStatus>(
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
    );
  }

  Widget _buildSubmitButton() {
    return StreamBuilder<FormzSubmissionStatus>(
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
                      child: CircularProgressIndicator(
                        color: Theme.of(context).disabledColor,
                      ),
                    )
                  : const Text('Login'),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CloseKeyboardLayout(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => context.pop(),
            splashRadius: 24,
            color: Theme.of(context).colorScheme.primary,
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, viewportConstraints) {
              return SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(24),
                  constraints: BoxConstraints(minHeight: viewportConstraints.maxHeight),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const FormHeader(title: 'TrackIt', subtitle: 'Login'),
                          const SizedBox(height: 24),
                          Wrap(
                            runSpacing: 12,
                            children: [
                              _buildEmailInput(),
                              _buildPasswordInput(),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildSubmitButton(),
                          const SizedBox(height: 12),
                          TextWithLinkAtEnd(
                            text: 'Don\'t have an account yet?',
                            linkText: 'Register now',
                            onLinkPressed: () => context.pushReplacementNamed(kRouteNameSignUp),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
