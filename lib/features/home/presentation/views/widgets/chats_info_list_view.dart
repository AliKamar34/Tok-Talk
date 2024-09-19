import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:new_project/core/utils/app_routes.dart';
import 'package:new_project/features/home/presentation/manager/chats_cubit/chats_cubit.dart';
import 'package:new_project/features/home/presentation/views/widgets/chat_info_button.dart';

class ChatsInfoListView extends StatelessWidget {
  const ChatsInfoListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsCubit, ChatsState>(
      builder: (context, state) {
        if (state is ChatsSuccess) {
          log('data from bloc builder');
          log(state.chats.toString());
          log(state.chats.length.toString());

          return ListView.builder(
            itemCount: state.chats.length,
            itemBuilder: (context, index) {
              return CustomChatInfoButton(
                chatModel: state.chats[index],
                onPressed: () {
                  GoRouter.of(context).push(
                    AppRoutes.kPrivateChateView,
                    extra: state.chats[index].personModel,
                  );
                },
              );
            },
          );
        } else if (state is ChatsFailuer) {
          return Text(state.errMessage);
        } else if (state is ChatsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Text('initial state');
        }
      },
    );
  }
}
