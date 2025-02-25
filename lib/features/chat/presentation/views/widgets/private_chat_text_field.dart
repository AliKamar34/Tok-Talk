import 'dart:developer';

import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_project/core/models/person_model.dart';
import 'package:new_project/core/utils/colors_data.dart';
import 'package:new_project/features/chat/data/models/enums/message_enum.dart';
import 'package:new_project/features/chat/presentation/manager/change_send_icon_cubit/change_send_icon_cubit.dart';
import 'package:new_project/features/chat/presentation/manager/private_chat_cubit/private_chat_cubit.dart';
import 'package:new_project/features/settings/data/models/enums/colors_enums.dart';

class PrivateChatTextFeild extends StatelessWidget {
  const PrivateChatTextFeild({super.key, required this.personModel});
  final PersonModel personModel;
  @override
  Widget build(BuildContext context) {
    return MessageBar(
      onSend: (message) {
        log('message sending');
        log(message);

        BlocProvider.of<PrivateChatCubit>(context).chatRepo.sendMessage(
              message,
              MessageEnum.textMessage,
              personModel.email,
              personModel.image,
              personModel.name,
            );
        BlocProvider.of<ChangeSendIconCubit>(context).changeIcon(true);
      }, // function to send message
     
      onTextChanged: (text) {
        if (text == '') {
          BlocProvider.of<ChangeSendIconCubit>(context).changeIcon(true);
        } else {
          BlocProvider.of<ChangeSendIconCubit>(context).changeIcon(false);
        }
      },
      sendIcon: BlocBuilder<ChangeSendIconCubit, ChangeSendIconState>(
        builder: (context, state) {
          if (state is ChangeSendIconIText) {
            return Icon(
              FontAwesomeIcons.solidPaperPlane,
              color: colorAssetData(context, ColorEnum.iconColor),
              size: 22,
            );
          } else {
            return GestureDetector(
              onLongPress: () {
                BlocProvider.of<PrivateChatCubit>(context)
                    .chatRepo
                    .startRecording();
                log('long press active');
              },
              onLongPressUp: () {
                BlocProvider.of<PrivateChatCubit>(context).chatRepo.sendRecord(
                      personModel.email,
                      personModel.image,
                      personModel.name,
                    );
                log('long press canceld');
              },
              child: Icon(
                FontAwesomeIcons.microphone,
                color: colorAssetData(context, ColorEnum.iconColor),
                size: 22,
              ),
            );
          }
        },
      ),
      messageBarColor: Colors.transparent,
      fillColor: colorAssetData(context, ColorEnum.primaryColor),
      messageBarHintStyle: TextStyle(
        color:
            colorAssetData(context, ColorEnum.secondaryColor).withOpacity(0.5),
        fontSize: 12,
      ),
      replyWidgetColor: colorAssetData(context, ColorEnum.primaryColor),
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 15),
          child: InkWell(
            child: Icon(
              FontAwesomeIcons.photoFilm,
              color: colorAssetData(context, ColorEnum.iconColor),
              size: 24,
            ),
            onTap: () {
              BlocProvider.of<PrivateChatCubit>(context).chatRepo.sendImage(
                    personModel.email,
                    personModel.image,
                    personModel.name,
                  );
            }, // function to send image
          ),
        ),
      ],
    );
  }
}
