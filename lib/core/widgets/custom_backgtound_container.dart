
import 'package:flutter/material.dart';
import 'package:new_project/core/utils/colors_data.dart';

class CustomBackgoundContainer extends StatelessWidget {
  const CustomBackgoundContainer({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final void Function()? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
        right: 12,
        bottom: 6,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorAssetData.kprimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
        ),
        child: child,
      ),
    );
  }
}
