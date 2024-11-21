import 'package:flutter/material.dart';

class ChannelInfo extends StatelessWidget {
  const ChannelInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        const Text('More About This Channel'),
      ],
    );
  }
}
