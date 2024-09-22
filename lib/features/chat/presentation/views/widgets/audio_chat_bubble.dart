import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:chat_bubbles/bubbles/bubble_normal_audio.dart';
import 'package:flutter/material.dart';
import 'package:new_project/core/utils/colors_data.dart';
import 'package:new_project/features/settings/data/models/enums/colors_enums.dart';

class AudioChatBubble extends StatefulWidget {
  const AudioChatBubble({
    super.key,
    required this.message, required this.delivered,
  });

  final String message;
  final bool delivered;

  @override
  State<AudioChatBubble> createState() => _AudioChatBubbleState();
}

class _AudioChatBubbleState extends State<AudioChatBubble> {
  Duration duration = const Duration();
  Duration position = const Duration();
  bool isPlaying = false;

  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();

    audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        duration = d;
      });
      log(d.toString());
      log(duration.toString());
    });

    audioPlayer.onPositionChanged.listen((Duration p) {
      setState(() {
        position = p;
      });
      log(p.toString());
      log(position.toString());
    });
    audioPlayer.onSeekComplete.listen((event) {
      stopSound();
    });
  }

  playSound(String message) {
    audioPlayer.play(UrlSource(message));
    log('sound played');
    log('volume of sound ${audioPlayer.getDuration()}');
    setState(() {
      isPlaying = true;
    });
  }

  stopSound() {
    audioPlayer.stop();
    log('sound stoped');
    setState(() {
      isPlaying = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BubbleNormalAudio(
      delivered: widget.delivered,
      fillColor: colorAssetData(context, ColorEnum.scaffoldColor),
      iconColor: colorAssetData(context, ColorEnum.iconColor),
      thumbColor: colorAssetData(context, ColorEnum.iconColor),
      color: colorAssetData(context, ColorEnum.primaryColor),
      duration: duration.inSeconds.toDouble(),
      position: position.inSeconds.toDouble(),
      isPlaying: isPlaying,
      isLoading: false,
      // isPause: isPause,
      onSeekChanged: (value) {
        Duration newPosition = Duration(seconds: value.toInt());
        audioPlayer.seek(newPosition);
      },
      onPlayPauseButtonClick: () {
        if (!isPlaying) {
          playSound(widget.message);
        } else {
          stopSound();
        }
      },
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
}
