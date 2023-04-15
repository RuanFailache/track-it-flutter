import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:track_it/utils/utils.dart';

import '../widgets.dart';

class AuthScreenLayout extends StatelessWidget {
  const AuthScreenLayout({
    super.key,
    required this.formFields,
    required this.title,
    required this.subtitle,
    required this.button,
    required this.link,
  });

  final String title;

  final String subtitle;

  final Widget button;

  final Widget link;

  final List<Widget> formFields;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return CloseKeyboardLayout(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => context.pop(),
            splashRadius: 24,
            color: colorScheme.primary,
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, viewportConstraints) {
              return SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(24),
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            title,
                            style: textTheme.headlineMedium?.copyWith(
                              color: colorScheme.primary,
                            ),
                          ),
                          8.sh,
                          Text(subtitle, style: textTheme.headlineSmall),
                          24.sh,
                          ListView.separated(
                            shrinkWrap: true,
                            itemCount: formFields.length,
                            padding: const EdgeInsets.only(bottom: 12),
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (_, index) => formFields[index],
                            separatorBuilder: (_, __) => 12.sh,
                          ),
                        ],
                      ),
                      Wrap(
                        spacing: 16,
                        direction: Axis.vertical,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          SizedBox(
                            width: viewportConstraints.maxWidth - 48,
                            child: button,
                          ),
                          link
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
