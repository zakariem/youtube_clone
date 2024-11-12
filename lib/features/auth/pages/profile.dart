import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/profile_providers.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({super.key});

  @override
  ConsumerState<Profile> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<Profile> {
  final TextEditingController _usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  // Corrected: Read the profileProvider and validate the username
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
                  onChanged: (value) {
                    validateUsername(); // Trigger the validation on each change
                  },
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // Handle successful validation
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.green),
                    ),
                    child: const Text('Continue'),
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
