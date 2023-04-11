import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:track_it/utils/utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              Text(
                'Comece a organizar sua vida agora mesmo, '
                'criando suas primeiras tarefas e listas.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              24.sh,
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () => context.push('/auth/sign-up'),
                    child: const Text('Let\'s create an account'),
                  ),
                  12.sh,
                  OutlinedButton(
                    onPressed: () => context.push('/auth/sign-in'),
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
