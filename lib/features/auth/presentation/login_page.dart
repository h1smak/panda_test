// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:panda_test/features/chat/presentation/chat_page.dart';
import 'package:panda_test/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final usernameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed:
                  authProvider.isLoading
                      ? null
                      : () async {
                        final username = usernameController.text.trim();
                        if (username.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Username is required'),
                            ),
                          );
                          return;
                        }

                        try {
                          await authProvider.login(username);
                          if (authProvider.user != null) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => ChatPage(
                                      username: authProvider.user!.username,
                                      accessToken:
                                          authProvider.user!.accessToken,
                                    ),
                              ),
                            );
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text('Error: $e')));
                        }
                      },
              child:
                  authProvider.isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
