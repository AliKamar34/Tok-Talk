import 'package:flutter/material.dart';

class CustomSettingAppBar extends StatelessWidget {
  const CustomSettingAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 48,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          'Setting',
          style: TextStyle(fontSize: 26),
        ),
      ),
    );
  }
}
