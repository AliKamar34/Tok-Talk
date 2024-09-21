import 'package:chat_bubbles/bubbles/bubble_normal_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/core/utils/colors_data.dart';
import 'package:new_project/features/chat/presentation/manager/private_chat_cubit/private_chat_cubit.dart';
import 'package:new_project/features/settings/data/models/enums/colors_enums.dart';

class AudioChatBubble extends StatelessWidget {
  const AudioChatBubble({
    super.key,
    required this.message,
  });

  final String message;
  @override
  Widget build(BuildContext context) {
    Duration duration = const Duration();
    Duration position = const Duration();
    bool isPlaying = true;
    // bool isPause = false;
    return BubbleNormalAudio(
      fillColor: colorAssetData(context, ColorEnum.scaffoldColor),
      iconColor: colorAssetData(context, ColorEnum.iconColor),
      thumbColor: colorAssetData(context, ColorEnum.iconColor),
      color: colorAssetData(context, ColorEnum.primaryColor),
      duration: duration.inSeconds.toDouble(),
      position: position.inSeconds.toDouble(),
      isPlaying: isPlaying,
      isLoading: false,
      // isPause: isPause,
      onSeekChanged: (e) {},
      onPlayPauseButtonClick: () {
        if (isPlaying == false) {
          isPlaying = BlocProvider.of<PrivateChatCubit>(context)
              .chatRepo
              .playRecord(message);
        } else {
          isPlaying =
              BlocProvider.of<PrivateChatCubit>(context).chatRepo.stopRecord();
        }
      },
      delivered: true,
    );
  }
}
