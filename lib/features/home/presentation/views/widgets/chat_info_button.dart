import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_project/core/service/date_format_service.dart';
import 'package:new_project/core/widgets/custom_backgtound_container.dart';
import 'package:new_project/features/chat/data/models/enums/message_enum.dart';
import 'package:new_project/features/home/data/models/chat_model.dart';
import 'package:new_project/features/home/presentation/views/widgets/custom_cirlce_image.dart';
import 'package:new_project/features/home/presentation/views/widgets/message_counter.dart';

class CustomChatInfoButton extends StatelessWidget {
  const CustomChatInfoButton({
    super.key,
    required this.onPressed,
    required this.chatModel,
  });
  final ChatModel chatModel;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat('h:mm a').format(chatModel.date);
    String formattedDays = getFormattedDate(chatModel.date);
    return CustomBackgoundContainer(
      onPressed: onPressed,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CustomCircleImage(
          imageUrl: chatModel.personModel.image,
        ),
        title: Text(
          chatModel.personModel.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: chatModel.messageType == MessageEnum.imageMessage.name
            ? const Text('Image Message')
            : chatModel.messageType == MessageEnum.recordMessage.name
                ? const Text('Voice Message')
                : Text(chatModel.message),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(formattedDays == 'Today' ? '' : formattedDays),
            Text(formattedTime),
            const MessageCounter(),
          ],
        ),
      ),
    );
  }
}
