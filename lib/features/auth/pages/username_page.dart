import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/features/auth/repository/user_data_service.dart';

import '../repository/profile_service.dart';

class UsernamePage extends ConsumerStatefulWidget {
  const UsernamePage({super.key});

  @override
  ConsumerState<UsernamePage> createState() => _UsernamePageState();
}

class _UsernamePageState extends ConsumerState<UsernamePage> {
  final TextEditingController _usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  // Corrected: Read the UsernameProvider and validate the username
  Future<void> validateUsername() async {
    final profileService = ref.read(profileProvider);
    final username = _usernameController.text.trim();

    final isValid = await profileService.validateUsername(username);
    ref.read(usernameValidationProvider.notifier).state = isValid;
  }

  @override
  Widget build(BuildContext context) {
    final isValidated = ref.watch(usernameValidationProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  'Enter the username',
                  style: TextStyle(color: Colors.blueGrey),
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    hintText: 'Enter the username',
                    suffixIcon: isValidated
                        ? const Icon(Icons.verified_user_rounded,
                            color: Colors.green)
                        : const Icon(Icons.error, color: Colors.red),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a username';
                    } else if (!isValidated) {
                      return 'Username is already taken';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUnfocus,
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      await validateUsername();
                      if (_formKey.currentState?.validate() ?? false) {
                        await ref
                            .read(userDataServiceProvider)
                            .addUserDataToFirestore(
                              username: _usernameController.text.trim(),
                            );
                      }
                    },
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.green),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
