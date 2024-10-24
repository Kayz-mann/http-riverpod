// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod/provider/api_provider.dart';

class CreateUserView extends ConsumerWidget {
  final _nameController = TextEditingController();
  final _jobController = TextEditingController();

  CreateUserView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Changed to WidgetRef
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create User"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _jobController,
              decoration: const InputDecoration(labelText: 'Job'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  final name = _nameController.text;
                  final job = _jobController.text;
                  await ref.read(userProvider.notifier).createUser(name, job);
                  Navigator.pop(context);
                },
                child: const Text('Submit'))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _jobController.dispose();
  }
}
