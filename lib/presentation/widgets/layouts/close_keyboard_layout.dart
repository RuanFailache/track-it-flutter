import 'package:flutter/material.dart';

class CloseKeyboardLayout extends StatelessWidget {
  const CloseKeyboardLayout({super.key, required this.child});

  final Widget child;

  void _closeKeyboard(BuildContext context) {
    final currentScope = FocusScope.of(context);
    if (!currentScope.hasPrimaryFocus) {
      currentScope.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _closeKeyboard(context),
      child: child,
    );
  }
}
