import 'package:flutter/material.dart';

import '../../constants/images.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Image.asset(Images.assetsImagesYoutubeSignin),
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
                Image.asset(Images.assetsImagesSigninwithgoogle),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
