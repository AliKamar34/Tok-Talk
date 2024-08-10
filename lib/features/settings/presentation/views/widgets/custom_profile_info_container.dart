
import 'package:flutter/material.dart';
import 'package:new_project/core/widgets/custom_backgtound_container.dart';

class CustomProfileInfoContainer extends StatelessWidget {
  const CustomProfileInfoContainer({
    super.key,
    required this.title,
    this.onPressed,
  });
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return CustomBackgoundContainer(
      onPressed: onPressed,
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}