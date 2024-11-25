import 'package:flutter/material.dart';
import 'package:youtube_clone/constants/icons.dart';
import 'package:youtube_clone/constants/images.dart';
import 'package:youtube_clone/features/channel/my_channel/widgets/setting_field_item.dart';

class MyChannelSettings extends StatefulWidget {
  const MyChannelSettings({super.key});

  @override
  State<MyChannelSettings> createState() => _MyChannelSettingsState();
}

class _MyChannelSettingsState extends State<MyChannelSettings> {
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    // Retrieve the screen's width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
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
                      backgroundColor: Colors.grey,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset(
                          Iconst.assetsIconsCamera,
                          height:
                              screenWidth * 0.05, // Icon size relative to width
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02), // 2% of screen height
            // Settings items
            SettingsItem(
              identifier: 'Name',
              onPressed: () {},
              value: 'Channel Name',
            ),
            SettingsItem(
              identifier: 'Handle',
              onPressed: () {},
              value: 'Channel username',
            ),
            SettingsItem(
              identifier: 'Description',
              onPressed: () {},
              value: 'Channel Description',
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
    );
  }
}
