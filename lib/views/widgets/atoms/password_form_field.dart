import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    super.key,
    this.focusNode,
    this.onChanged,
    this.decoration,
    this.textInputAction,
    this.onFieldSubmitted,
    this.readOnly = false,
  });

  final bool readOnly;

  final FocusNode? focusNode;

  final InputDecoration? decoration;

  final TextInputAction? textInputAction;

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
    if (widget.focusNode?.hasPrimaryFocus == false) {
      FocusScope.of(context).requestFocus(widget.focusNode);
    }
    setState(() => shouldShowPassword = !shouldShowPassword);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      onChanged: widget.onChanged,
      focusNode: widget.focusNode,
      obscureText: !shouldShowPassword,
      textInputAction: widget.textInputAction,
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
