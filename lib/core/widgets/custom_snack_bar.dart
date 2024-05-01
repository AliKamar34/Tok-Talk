import 'package:flutter/material.dart';
import 'package:new_project/core/utils/colors_data.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: ColorAssetData.kprimaryColor,
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
