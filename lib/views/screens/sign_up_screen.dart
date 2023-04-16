import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:track_it/app/config/routes.dart';
import 'package:track_it/views/presenters/sign_up_presenter.dart';

import '../widgets/widgets.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key, required this.presenter});

  final SignUpPresenter presenter;

  Widget _buildFullNameInput() {
    return StreamBuilder<FormzSubmissionStatus>(
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
    );
  }

  Widget _buildEmailInput() {
    return StreamBuilder<FormzSubmissionStatus>(
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
    );
  }

  Widget _buildConfirmPasswordInput() {
    final confirmPasswordFocusNode = FocusNode();

    return StreamBuilder<FormzSubmissionStatus>(
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
                  : const Text('Create an account'),
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
                          const FormHeader(title: 'TrackIt', subtitle: 'Signup'),
                          const SizedBox(height: 24),
                          Wrap(
                            runSpacing: 12,
                            children: [
                              _buildFullNameInput(),
                              _buildEmailInput(),
                              _buildPasswordInput(),
                              _buildConfirmPasswordInput(),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildSubmitButton(),
                          const SizedBox(height: 12),
                          TextWithLinkAtEnd(
                            text: 'Already have an account?',
                            linkText: 'Login',
                            onLinkPressed: () => context.pushReplacementNamed(kRouteNameSignIn),
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
