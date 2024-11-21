import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/features/auth/provider/user_provider.dart';

import '../../../../cores/screens/error.dart';
import '../../../../cores/screens/loader.dart';
import '../widgets/action_butttons.dart';
import '../widgets/channel_header.dart';
import '../widgets/channel_info.dart';
import '../widgets/channel_tabs.dart';

class MyChannelPage extends ConsumerWidget {
  const MyChannelPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, ref, child) {
      final userData = ref.watch(currentUserProvider);
      return userData.when(
        data: (data) => DefaultTabController(
          length: 7,
          child: Scaffold(
            body: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    ChannelHeader(
                      url: data.profilePic,
                      username: data.username,
                    ),
                    const SizedBox(height: 10),
                    ChannelInfo(
                      email: data.email,
                      subscribers: data.subscribers.toString(),
                      videos: data.videos.toString(),
                    ),
                    const SizedBox(height: 10),
                    const ActionButtons(),
                    const SizedBox(height: 10),
                    const ChannelTabs(),
                  ],
                ),
              ),
            ),
          ),
        ),
        loading: () => const Loader(),
        error: (error, stackTrace) => const ErrorPage(),
      );
    });
  }
}
