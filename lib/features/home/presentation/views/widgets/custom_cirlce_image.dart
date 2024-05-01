import 'package:flutter/material.dart';
import 'package:new_project/core/utils/assets_data.dart';

class CustomCircleImage extends StatelessWidget {
  const CustomCircleImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: CircleAvatar(
        child: Image.asset(
          AssetsData.logo,
        ),
      ),
    );
  }
}
