import 'package:flutter/material.dart';

class ChannelTabs extends StatelessWidget {
  const ChannelTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      labelStyle: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelColor: Colors.black54,
      labelColor: Colors.black,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 3,
          ),
        ),
      ),
      tabs: [
        Tab(text: 'Home'),
        Tab(text: 'Videos'),
        Tab(text: 'Shorts'),
        Tab(text: 'Playlists'),
        Tab(text: 'Community'),
        Tab(text: 'Channel'),
        Tab(text: 'About'),
      ],
    );
  }
}
