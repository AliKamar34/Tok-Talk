import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/features/chat/data/models/message_model.dart';
import 'package:new_project/features/chat/data/repos/chat_repo.dart';

part 'private_chat_state.dart';

class PrivateChatCubit extends Cubit<PrivateChatState> {
  PrivateChatCubit(this.chatRepo) : super(PrivateChatInitial());

  final ChatRepo chatRepo;
  StreamSubscription? _friendsSubscription;
  getMessages({required String receverEmail}) {
    emit(PrivateChatLoading());
     _friendsSubscription =
        chatRepo.getMessages(receverEmail: receverEmail).listen((event) {
      event.fold((failure) {
        emit(PrivateChatFailure(errMessage: failure.errorMessage));
      },
      (messages) {
        log('messages length from cubit ${messages.length.toString()}');
        emit(PrivateChatSuccess(messages: messages));
      },);
    });
    // result.fold(
    //   (failure) {
    //     emit(PrivateChatFailure(errMessage: failure.errorMessage));
    //   },
    //   (messages) {
    //     log('messages length from cubit ${messages.length.toString()}');
    //     emit(PrivateChatSuccess(messages: messages));
    //   },
    // );
  }

   @override
  Future<void> close() {
    _friendsSubscription?.cancel();
    return super.close();
  }

}
