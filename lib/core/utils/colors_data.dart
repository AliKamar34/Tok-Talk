import 'package:flutter/material.dart';
import 'package:new_project/features/settings/data/models/enums/colors_enums.dart';

Color colorAssetData(BuildContext context, ColorEnum colorType) {
  if (Theme.of(context).brightness == Brightness.dark) {
    switch (colorType) {
      case ColorEnum.scaffoldColor:
        return const Color(0xff161616);
      case ColorEnum.secondaryColor:
        return const Color(0xffD7151A);
      case ColorEnum.primaryColor:
        return const Color(0xff303030);
      case ColorEnum.textColor:
        return Colors.white;
      case ColorEnum.iconColor:
        return const Color(0xffF4F4F4);
      case ColorEnum.userMessageBubble:
        return const Color(0xff424242);
      case ColorEnum.friendMessageBubble:
        return const Color(0xffD32F2F);
      default:
        return const Color(0xff161616);
    }
  } else {
    switch (colorType) {
      case ColorEnum.scaffoldColor:
        return const Color(0xffE9EDC9);
      case ColorEnum.primaryColor:
        return const Color(0xffCCD5AE);
      case ColorEnum.secondaryColor:
        return const Color(0xff6D4722);
      case ColorEnum.textColor:
        return Colors.black;
      case ColorEnum.iconColor:
        return const Color(0xff4F772D);
     case ColorEnum.userMessageBubble:
        return const Color(0xffB7E4C7);
      case ColorEnum.friendMessageBubble:
        return const Color(0xffFFD6A5);
      default:
        return const Color(0xffE9EDC9);
    }
  }
}
