
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_project/core/utils/colors_data.dart';

class CustomGrpoupsAppBar extends StatelessWidget {
  const CustomGrpoupsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Groups',
              style: TextStyle(fontSize: 26),
            ),
            ElevatedButton(
              onPressed: () {},
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.transparent),
              child: const Text(
                'New Group',
                style: TextStyle(color: ColorAssetData.kSecondaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
