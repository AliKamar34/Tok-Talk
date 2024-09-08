import 'package:flutter/material.dart';
import 'package:new_project/core/utils/colors_data.dart';
import 'package:new_project/features/settings/data/models/enums/colors_enums.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor:colorAssetData(context,ColorEnum.primaryColor),
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
