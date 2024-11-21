import 'package:flutter/material.dart';

class ChannelInfo extends StatelessWidget {
  const ChannelInfo({
    super.key,
    this.email,
    this.subscribers,
    this.videos,
  });
  final String? email;
  final String? subscribers;
  final String? videos;

  String subscribersCount() {
    if (subscribers == null) {
      return 'No subscribers';
    }
    return '${subscribers!.length} subscribers';
  }

  String videosCount() {
    if (videos == null) {
      return 'No videos';
    }
    return '  $videos videos';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(email ?? ''),
        const SizedBox(height: 10),
        RichText(
          text: TextSpan(
            style: const TextStyle(color: Colors.blueGrey),
            children: [
              TextSpan(
                text: subscribersCount(),
              ),
              TextSpan(text: videosCount()),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Text('More About This Channel'),
      ],
    );
  }
}
