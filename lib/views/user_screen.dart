import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../viewmodels/user_viewmodel.dart';

class UserScreen extends ConsumerWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userViewModelProvider);
    final viewModel = ref.read(userViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: userState.when(
            loading: () => const CircularProgressIndicator(),
            error: (e, _) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.error_outline, size: 48, color: Colors.red),
                const SizedBox(height: 12),
                Text('Something went wrong\n$e', textAlign: TextAlign.center),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: viewModel.loadUser,
                  child: const Text('Retry'),
                ),
              ],
            ),
            data: (user) {
              if (user == null) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.person_outline, size: 64),
                    const SizedBox(height: 12),
                    const Text('No user loaded'),
                    const SizedBox(height: 16),
                    FilledButton.icon(
                      onPressed: viewModel.loadUser,
                      icon: const Icon(Icons.download),
                      label: const Text('Load user'),
                    ),
                  ],
                );
              }

              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 36,
                        child: Text(
                          user.name.isEmpty ? '?' : user.name[0].toUpperCase(),
                          style: const TextStyle(fontSize: 28),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        user.name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      FilledButton(
                        onPressed: () => context.push('/details'),
                        child: const Text('View details'),
                      ),
                      TextButton(
                        onPressed: viewModel.loadUser,
                        child: const Text('Reload'),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}