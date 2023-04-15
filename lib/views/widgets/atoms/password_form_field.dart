import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    super.key,
    this.focusNode,
    this.onChanged,
    this.decoration,
    this.onFieldSubmitted,
    this.readOnly = false,
  });

  final bool readOnly;

  final FocusNode? focusNode;

  final InputDecoration? decoration;

  final void Function(String value)? onChanged;

  final void Function(String value)? onFieldSubmitted;

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
      readOnly: widget.readOnly,
      onChanged: widget.onChanged,
      focusNode: widget.focusNode,
      obscureText: !shouldShowPassword,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: widget.decoration?.copyWith(
        suffixIcon: GestureDetector(
          onTap: () => toggleVisibility(context),
          child: Icon(suffixIcon),
        ),
      ),
    );
  }
}
