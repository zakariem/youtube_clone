import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/constants/icons.dart';
import 'package:youtube_clone/constants/images.dart';
import 'package:youtube_clone/cores/screens/error.dart';
import 'package:youtube_clone/cores/screens/loader.dart';
import 'package:youtube_clone/features/auth/provider/user_provider.dart';
import 'package:youtube_clone/features/auth/repository/profile_service.dart';
import 'package:youtube_clone/features/channel/my_channel/repository/edit_field.dart';
import 'package:youtube_clone/features/channel/my_channel/widgets/setting_field_item.dart';
import 'package:youtube_clone/features/channel/my_channel/widgets/edit_setting_dialog.dart';

class MyChannelSettings extends ConsumerStatefulWidget {
  const MyChannelSettings({super.key});

  @override
  ConsumerState<MyChannelSettings> createState() => _MyChannelSettingsState();
}

class _MyChannelSettingsState extends ConsumerState<MyChannelSettings> {
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    // Retrieve the screen's width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return ref.watch(currentUserProvider).when(
          data: (data) => Scaffold(
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      // Background image
                      Image.asset(
                        Images.assetsImagesFlutterBackground,
                        height: screenHeight * 0.25, // 25% of the screen height
                        width: screenWidth, // Full width
                        fit: BoxFit.cover,
                      ),
                      // Centered CircleAvatar
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.1),
                          child: CircleAvatar(
                            radius: screenWidth * 0.08, // Scaled radius
                            backgroundImage: NetworkImage(data.profilePic),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            Iconst.assetsIconsCamera,
                            height: screenWidth *
                                0.10, // Icon size relative to width
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02), // 2% of screen height
                  // Settings items
                  SettingsItem(
                    identifier: 'Name',
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => SettingsDialog(
                          identifier: 'Name',
                          initialValue: data.displayName,
                          onSave: (name) async {
                            await ref
                                .read(editSitingsProvider)
                                .editDisplayName(name);
                            ref.invalidate(currentUserProvider);
                          },
                        ),
                      );
                    },
                    value: data.displayName,
                  ),
                  SettingsItem(
                    identifier: 'Handle',
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => SettingsDialog(
                          identifier: 'Handle',
                          initialValue: data.username,
                          isUsernameField: true,
                          onSave: (username) async {
                            await ref
                                .read(editSitingsProvider)
                                .editDisplayUserName(username);
                            ref.invalidate(currentUserProvider);
                          },
                        ),
                      );
                    },
                    value: data.username,
                  ),
                  SettingsItem(
                    identifier: 'Description',
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => SettingsDialog(
                          identifier: 'Description',
                          initialValue: data.des,
                          onSave: (description) async {
                            await ref
                                .read(editSitingsProvider)
                                .editDisplayDes(description);
                            ref.invalidate(currentUserProvider);
                          },
                        ),
                      );
                    },
                    value: data.des,
                  ),
                  // Action checkbox
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight * 0.01,
                      bottom: screenHeight * 0.01,
                      left: screenWidth * 0.04,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Keep all my subscribers private'),
                        Checkbox(
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          error: (error, stackTrace) => const ErrorPage(),
          loading: () => const Loader(),
        );
  }
}
