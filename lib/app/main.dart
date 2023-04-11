import 'package:flutter/material.dart';
import 'package:track_it/app/config/theme/theme.dart';
import 'package:track_it/presentation/presentation.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      home: const SignInScreen(),
    );
  }
}
