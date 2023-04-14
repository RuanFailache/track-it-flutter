import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:track_it/views/views.dart';

import '../factories/factories.dart';

final _defaultFadeTransitionCurve = CurveTween(curve: Curves.easeInOut);

const kRouteNameWelcome = 'welcome';
const kRouteNameSignIn = 'sign-in';
const kRouteNameSignUp = 'sign-up';

final appRouter = GoRouter(
  initialLocation: '/auth',
  routes: <RouteBase>[
    GoRoute(
      path: '/auth',
      name: kRouteNameWelcome,
      builder: (context, state) => const WelcomeScreen(),
      routes: [
        GoRoute(
          path: 'sign-in',
          name: kRouteNameSignIn,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: makeSignInScreen(),
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
          name: kRouteNameSignUp,
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
