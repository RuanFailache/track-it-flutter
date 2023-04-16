import 'package:flutter/material.dart';

class FormHeader extends StatelessWidget {
  const FormHeader({
    super.key,
    this.subtitle,
    required this.title,
  });

  final String title;

  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: textTheme.headlineMedium?.copyWith(color: colorScheme.primary)),
        if (subtitle != null) ...[
          const SizedBox(height: 8),
          Text(subtitle!, style: textTheme.headlineSmall),
        ],
      ],
    );
  }
}
