import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodels/user_viewmodel.dart';

class UserDetailsScreen extends ConsumerWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userViewModelProvider).value;

    return Scaffold(
      appBar: AppBar(title: const Text('User Details')),
      body: user == null
          ? const Center(child: Text('No user loaded'))
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.tag),
                      title: const Text('ID'),
                      subtitle: Text('${user.id}'),
                    ),
                    const Divider(height: 0),
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text('Name'),
                      subtitle: Text(user.name),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}