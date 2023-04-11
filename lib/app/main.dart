import 'package:flutter/material.dart';
import 'package:track_it/app/config/routes.dart';
import 'package:track_it/app/config/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: appTheme,
      routerConfig: appRouter,
    );
  }
}
