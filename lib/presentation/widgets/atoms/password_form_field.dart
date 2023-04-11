import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    super.key,
    this.hintText,
    this.focusNode,
    required this.prefixIcon,
  });

  final String? hintText;

  final IconData prefixIcon;

  final FocusNode? focusNode;

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
      focusNode: widget.focusNode,
      obscureText: !shouldShowPassword,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: Icon(widget.prefixIcon),
        suffixIcon: GestureDetector(
          onTap: () => toggleVisibility(context),
          child: Icon(suffixIcon),
        ),
      ),
    );
  }
}
