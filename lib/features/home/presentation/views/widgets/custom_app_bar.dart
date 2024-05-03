import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 65,
      width: double.infinity,
      child: Center(
        child: Text(
          'Chats',
          style: TextStyle(fontSize: 26),
        ),
      ),
    );
  }
}
