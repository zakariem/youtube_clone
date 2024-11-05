import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/images.dart';
import '../repository/auth_service.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Image.asset(
                  Images.assetsImagesYoutubeSignin,
                  height: 150,
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Wellcome to YouTube',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () async {
                    await ref.read(authServiceProvider).signInWithGoogle();
                  },
                  child: Image.asset(
                    Images.assetsImagesSigninwithgoogle,
                    height: 60,
                  ),
                ),
                const SizedBox(
                  height: 55,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
