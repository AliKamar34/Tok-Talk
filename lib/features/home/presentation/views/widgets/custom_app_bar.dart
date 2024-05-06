import 'package:flutter/material.dart';
import 'package:new_project/core/widgets/custom_elevated_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.buttonTitle,
    this.onPressed,
  });

  final String title;
  final String buttonTitle;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 26),
            ),
            CustomElevateButton(
              onPressed: onPressed,
              buttonTitle: buttonTitle,
              buttonColor: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
