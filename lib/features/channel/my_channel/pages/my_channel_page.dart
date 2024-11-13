import 'package:flutter/material.dart';
import 'package:youtube_clone/cores/colors.dart';
import 'package:youtube_clone/cores/widgets/image_button.dart';

import '../../../../constants/icons.dart';

class MyChannelPage extends StatelessWidget {
  const MyChannelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
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
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: 41,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: softBlueGreyBackGround,
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Manage Videos',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ImageButton(
                          onPressed: () {},
                          image: Iconst.assetsIconsPen,
                          haveColor: true,
                        ),
                      ),
                      Expanded(
                        child: ImageButton(
                          onPressed: () {},
                          image: Iconst.assetsIconsTimeWatched,
                          haveColor: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const TabBar(
                    isScrollable: true,
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
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 8),
                    tabs: [
                      Tab(text: 'Home'),
                      Tab(text: 'Videos'),
                      Tab(text: 'Shorts'),
                      Tab(text: 'Playlists'),
                      Tab(text: 'Community'),
                      Tab(text: 'Channel'),
                      Tab(text: 'About'),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
