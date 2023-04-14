import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    super.key,
    this.focusNode,
    this.onChanged,
    this.decoration,
  });

  final FocusNode? focusNode;

  final InputDecoration? decoration;

  final void Function(String value)? onChanged;

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool shouldShowPassword = false;

  IconData get suffixIcon {
    if (shouldShowPassword) return Icons.visibility;
    return Icons.visibility_off;
  }

  void toggleVisibility(BuildContext context) {
    setState(() {
      FocusScope.of(context).requestFocus(widget.focusNode);
      shouldShowPassword = !shouldShowPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      focusNode: widget.focusNode,
      obscureText: !shouldShowPassword,
      decoration: widget.decoration?.copyWith(
        suffixIcon: GestureDetector(
          onTap: () => toggleVisibility(context),
          child: Icon(suffixIcon),
        ),
      ),
    );
  }
}
