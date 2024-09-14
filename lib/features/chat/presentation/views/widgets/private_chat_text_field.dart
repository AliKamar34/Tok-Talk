import 'dart:developer';

import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/material.dart';
import 'package:new_project/core/utils/colors_data.dart';
import 'package:new_project/features/settings/data/models/enums/colors_enums.dart';

class PrivateChatTextFeild extends StatelessWidget {
  const PrivateChatTextFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return MessageBar(
      onSend: (_) => log('gfg'), // function to send message
      messageBarColor: Colors.transparent,

      messageBarHintStyle: TextStyle(
        color: colorAssetData(context, ColorEnum.primaryColor).withOpacity(0.5),
        fontSize: 12,
      ),
      replyWidgetColor: colorAssetData(context, ColorEnum.primaryColor),
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: InkWell(
            child: Icon(
              Icons.camera_alt,
              color: colorAssetData(context, ColorEnum.primaryColor),
              size: 24,
            ),
            onTap: () {}, // function to send image
          ),
        ),
      ],
    );
  }
}
