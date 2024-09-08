import 'package:flutter/material.dart';
import 'package:new_project/core/utils/colors_data.dart';
import 'package:new_project/features/settings/data/models/enums/colors_enums.dart';

class CustomElevateButton extends StatelessWidget {
  const CustomElevateButton({
    super.key,
    required this.onPressed,
    required this.buttonTitle, required this.buttonColor,
  });

  final void Function()? onPressed;
  final String buttonTitle;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor:buttonColor),
      child: Text(
        buttonTitle,
        style:  TextStyle(color: colorAssetData(context , ColorEnum.secondaryColor)),
      ),
    );
  }
}
