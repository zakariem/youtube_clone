import 'package:flutter/material.dart';

class MyChannelPage extends StatelessWidget {
  const MyChannelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 34,
                  backgroundColor: Colors.grey,
                ),
                const SizedBox(height: 6),
                const Text(
                  'Zakarie Mahad',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(color: Colors.blueGrey),
                    children: [
                      TextSpan(text: 'zakarie@gmail.com  '),
                      TextSpan(
                        text: 'No Subscription  ',
                      ),
                      TextSpan(text: 'No Videos'),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'More About This Channel',
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.grey.shade300,
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Manage Videos',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
