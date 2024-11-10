import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/cores/widgets/flat_button.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Text(
                'Enter the username',
                style: TextStyle(
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter the username',
                  suffixIcon: Icon(Icons.verified_user_rounded),
                  suffixIconColor: Colors.green,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: FlatButton(
                  text: 'Continue',
                  onPressed: () {},
                  colour: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
