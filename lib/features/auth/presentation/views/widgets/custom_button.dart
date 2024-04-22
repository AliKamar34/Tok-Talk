import 'package:flutter/material.dart';

import 'package:new_project/core/utils/colors_data.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, required this.onPressed});
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorAssetData.kSecondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      child: SizedBox(
        height: 60,
        child: Center(child: Text(title)),
      ),
    );
  }
}
