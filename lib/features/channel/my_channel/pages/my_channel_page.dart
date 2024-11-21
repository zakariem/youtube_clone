import 'package:flutter/material.dart';

import '../widgets/action_butttons.dart';
import '../widgets/channel_header.dart';
import '../widgets/channel_info.dart';
import '../widgets/channel_tabs.dart';

class MyChannelPage extends StatelessWidget {
  const MyChannelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 7,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 24),
                ChannelHeader(),
                SizedBox(height: 10),
                ChannelInfo(),
                SizedBox(height: 10),
                ActionButtons(),
                SizedBox(height: 10),
                ChannelTabs(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
