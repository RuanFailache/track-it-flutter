import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:track_it/app/config/routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'TrackIt',
                textAlign: TextAlign.center,
                style: textTheme.displayLarge?.copyWith(
                  color: colorScheme.primary,
                ),
              ),
              Text(
                'Comece a organizar sua vida agora mesmo, '
                'criando suas primeiras tarefas e listas.',
                textAlign: TextAlign.center,
                style: textTheme.headlineSmall,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () => context.pushNamed(kRouteNameSignUp),
                    child: const Text('Let\'s create an account'),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton(
                    onPressed: () => context.pushNamed(kRouteNameSignIn),
                    child: const Text('Already have an account?'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
