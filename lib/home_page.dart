import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/constants/icons.dart';
import 'package:youtube_clone/cores/screens/loader.dart';
import 'package:youtube_clone/cores/widgets/image_button.dart';
import 'constants/images.dart';
import 'cores/screens/error.dart';
import 'features/auth/provider/user_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  Images.assetsImagesYoutubeLogo,
                  height: 36,
                ),
                const SizedBox(width: 4),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: SizedBox(
                    height: 42,
                    child: ImageButton(
                      image: Iconst.assetsIconsCast,
                      onPressed: () {},
                      haveColor: false,
                    ),
                  ),
                ),
                SizedBox(
                  height: 38,
                  child: ImageButton(
                    image: Iconst.assetsIconsNotification,
                    onPressed: () {},
                    haveColor: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 15),
                  child: SizedBox(
                    height: 41.5,
                    child: ImageButton(
                      image: Iconst.assetsIconsSearch,
                      onPressed: () {},
                      haveColor: false,
                    ),
                  ),
                ),
                Consumer(builder: (context, ref, child) {
                  final userData = ref.watch(currentUserProvider);

                  return userData.when(
                      data: (data) => Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: CircleAvatar(
                              radius: 14,
                              backgroundColor: Colors.grey,
                              backgroundImage: NetworkImage(data.profilePic),
                            ),
                          ),
                      loading: () => const Loader(),
                      error: (error, stackTrace) => const ErrorPage());
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
