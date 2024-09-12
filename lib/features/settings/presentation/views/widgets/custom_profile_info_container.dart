import 'package:flutter/material.dart';
import 'package:new_project/core/widgets/custom_backgtound_container.dart';

class CustomProfileInfoContainer extends StatelessWidget {
  const CustomProfileInfoContainer({
    super.key,
    required this.title,
    this.onPressed,
    required this.subTitle,
    required this.icon,
  });
  final String title, subTitle;
  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomBackgoundContainer(
      onPressed: onPressed,
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subTitle),
      ),
    );
  }
}
