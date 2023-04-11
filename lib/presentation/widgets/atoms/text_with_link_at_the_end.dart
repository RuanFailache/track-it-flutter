import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextWithLinkAtEnd extends StatelessWidget {
  const TextWithLinkAtEnd({
    super.key,
    required this.text,
    required this.linkText,
    required this.onLinkPressed,
    this.textAlign = TextAlign.center,
  });

  final TextAlign textAlign;
  final String text, linkText;
  final void Function() onLinkPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Text.rich(
      textAlign: textAlign,
      TextSpan(
        text: '$text ',
        style: textTheme.bodyMedium,
        children: [
          TextSpan(
            text: linkText,
            recognizer: TapGestureRecognizer()..onTap = onLinkPressed,
            style: textTheme.bodyMedium?.copyWith(color: colorScheme.primary),
          ),
        ],
      ),
    );
  }
}
