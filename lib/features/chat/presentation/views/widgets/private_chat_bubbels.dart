import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_bubbles/bubbles/bubble_normal_image.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:new_project/core/utils/colors_data.dart';
import 'package:new_project/features/chat/data/models/enums/message_enum.dart';
import 'package:new_project/features/chat/presentation/views/widgets/audio_chat_bubble.dart';
import 'package:new_project/features/settings/data/models/enums/colors_enums.dart';

class PrivateChatSenderBubbles extends StatelessWidget {
  const PrivateChatSenderBubbles(
      {super.key, required this.message, required this.messageEnum});
  final String message;
  final String messageEnum;

  @override
  Widget build(BuildContext context) {
    return messageEnum == MessageEnum.imageMessage.name
        ? BubbleNormalImage(
            id: 'id001',
            image: CachedNetworkImage(
              imageUrl: message,
            ),
            color: colorAssetData(context, ColorEnum.userMessageBubble),
            delivered: false,
          )
        : messageEnum == MessageEnum.recordMessage.name
            ? AudioChatBubble(
                message: message,
                delivered: false,
                isSender: true,
                color: colorAssetData(context, ColorEnum.userMessageBubble),
              )
            : BubbleSpecialThree(
                text: message,
                color: colorAssetData(context, ColorEnum.userMessageBubble),
                tail: false,
                sent: false,
                delivered: false,
                seen: false,
                textStyle: TextStyle(
                  color: colorAssetData(context, ColorEnum.textColor),
                  fontSize: 16,
                ),
              );
  }
}

class PrivateChatReseverBubbles extends StatelessWidget {
  const PrivateChatReseverBubbles(
      {super.key, required this.message, required this.messageEnum});
  final String message;
  final String messageEnum;
  @override
  Widget build(BuildContext context) {
    return messageEnum == MessageEnum.imageMessage.name
        ? BubbleNormalImage(
            id: 'id001',
            image: CachedNetworkImage(
              imageUrl: message,
            ),
            color: colorAssetData(context, ColorEnum.friendMessageBubble),
            isSender: false,
          )
        : messageEnum == MessageEnum.recordMessage.name
            ? AudioChatBubble(
                message: message,
                delivered: false,
                isSender: false,
                color: colorAssetData(context, ColorEnum.friendMessageBubble),
              )
            : BubbleSpecialThree(
                text: message,
                color: colorAssetData(context, ColorEnum.friendMessageBubble),
                tail: false,
                isSender: false,
                textStyle: TextStyle(
                  color: colorAssetData(context, ColorEnum.textColor),
                  fontSize: 16,
                ),
              );
  }
}
