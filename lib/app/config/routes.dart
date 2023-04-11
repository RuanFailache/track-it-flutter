import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:track_it/presentation/presentation.dart';

final _defaultFadeTransitionCurve = CurveTween(curve: Curves.easeInOut);

final appRouter = GoRouter(
  initialLocation: '/auth',
  routes: <RouteBase>[
    GoRoute(
      path: '/auth',
      builder: (context, state) => const WelcomeScreen(),
      routes: [
        GoRoute(
          path: 'sign-in',
          builder: (context, state) => const SignInScreen(),
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const SignInScreen(),
            transitionsBuilder: (_, animation, __, child) {
              return FadeTransition(
                opacity: _defaultFadeTransitionCurve.animate(animation),
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          path: 'sign-up',
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const SignUpScreen(),
            transitionsBuilder: (_, animation, __, child) {
              return FadeTransition(
                opacity: _defaultFadeTransitionCurve.animate(animation),
                child: child,
              );
            },
          ),
        )
      ],
    ),
  ],
);
