import 'package:flutter/material.dart';

class ChannelHeader extends StatelessWidget {
  const ChannelHeader({super.key, this.username, this.url});
  final String? username;
  final String? url;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 34,
          backgroundImage: NetworkImage(url ??
              'https://community.softr.io/uploads/db9110/original/2X/7/74e6e7e382d0ff5d7773ca9a87e6f6f8817a68a6.jpeg'),
        ),
        const SizedBox(height: 6),
        Text(
          username ?? '',
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
