import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:new_project/core/utils/colors_data.dart';
import 'package:new_project/features/settings/data/models/enums/colors_enums.dart';

class PrivateChatSenderBubbles extends StatelessWidget {
  const PrivateChatSenderBubbles({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return BubbleSpecialThree(
      text: message,
      color: colorAssetData(context, ColorEnum.primaryColor),
      tail: false,
      sent: true,
      delivered: true,
      seen: true,
      textStyle: TextStyle(
        color: colorAssetData(context, ColorEnum.textColor),
        fontSize: 16,
      ),
    );
  }
}

class PrivateChatReseverBubbles extends StatelessWidget {
  const PrivateChatReseverBubbles({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return BubbleSpecialThree(
      text: message,
      color: colorAssetData(context, ColorEnum.primaryColor),
      tail: false,
      isSender: false,
      textStyle: TextStyle(
        color: colorAssetData(context, ColorEnum.textColor),
        fontSize: 16,
      ),
    );
  }
}
