
import 'package:flutter/material.dart';
import 'package:new_project/core/utils/colors_data.dart';

class CustomFriendsAppBar extends StatelessWidget {
  const CustomFriendsAppBar({
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
              'Friends',
              style: TextStyle(fontSize: 26),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    padding: const EdgeInsets.all(8),
                  ),
                  child: const Text(
                    'Search',
                    style: TextStyle(color: ColorAssetData.kSecondaryColor),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    padding: const EdgeInsets.all(8),
                  ),
                  child: const Text(
                    'Requests',
                    style: TextStyle(color: ColorAssetData.kSecondaryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
