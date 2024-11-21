import 'package:flutter/material.dart';

class ChannelHeader extends StatelessWidget {
  const ChannelHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CircleAvatar(
          radius: 34,
          backgroundColor: Colors.grey,
        ),
        SizedBox(height: 6),
        Text(
          'Zakarie Mahad',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
