import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/core/widgets/custom_loading_indicator.dart';
import 'package:new_project/features/chat/presentation/manager/private_chat_cubit/private_chat_cubit.dart';
import 'package:new_project/features/chat/presentation/views/widgets/private_chat_bubbels.dart';

class PrivateChatListViewMessages extends StatelessWidget {
  const PrivateChatListViewMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrivateChatCubit, PrivateChatState>(
      builder: (context, state) {
        if (state is PrivateChatSuccess) {
          log('messages length from listView ${state.messages.length.toString()}');
          return ListView.builder(
            reverse: true,
            itemCount: state.messages.length,
            itemBuilder: ((context, index) {
              if (state.messages[state.messages.length - (index + 1)]
                      .senderEmail ==
                  FirebaseAuth.instance.currentUser!.email) {
                return PrivateChatSenderBubbles(
                  messageEnum: state
                      .messages[state.messages.length - (index + 1)]
                      .messageType,
                  message: state
                      .messages[state.messages.length - (index + 1)].message,
                );
              } else {
                return PrivateChatReseverBubbles(
                  messageEnum: state
                      .messages[state.messages.length - (index + 1)]
                      .messageType,
                  message: state
                      .messages[state.messages.length - (index + 1)].message,
                );
              }
            }),
          );
        } else if (state is PrivateChatFailure) {
          return Text(state.errMessage);
        } else if (state is PrivateChatLoading) {
          return const CustomLoadingIndicator();
        } else {
          return const Text('initial state');
        }
      },
    );
  }
}
