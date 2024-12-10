import 'package:flutter/material.dart';
import 'package:youtube_clone/constants/images.dart';
import 'package:youtube_clone/cores/widgets/flat_button.dart';

class UserChannelPage extends StatefulWidget {
  const UserChannelPage({super.key});

  @override
  State<UserChannelPage> createState() => _UserChannelPageState();
}

class _UserChannelPageState extends State<UserChannelPage> {
  bool hasvideos = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              Images.assetsImagesFlutterBackground,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ahmed Ali',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '@ahmed-ai',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueGrey,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.blueGrey,
                          ),
                          children: [
                            TextSpan(text: 'No subscribers and '),
                            TextSpan(text: 'No videos'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: double.infinity,
                child: FlatButton(
                    text: 'Subscribe', onPressed: () {}, colour: Colors.red),
              ),
            ),
            hasvideos
                ? Text(
                    'Videos',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.sizeOf(context).height * 0.2),
                    child: Text(
                      'No videos',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
