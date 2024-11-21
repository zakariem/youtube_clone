import 'package:flutter/material.dart';

import '../../../../constants/icons.dart';
import '../../../../cores/colors.dart';
import '../../../../cores/widgets/image_button.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
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
    );
  }
}
