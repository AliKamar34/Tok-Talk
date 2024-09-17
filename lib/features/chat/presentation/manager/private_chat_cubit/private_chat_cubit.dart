import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/features/chat/data/repos/chat_repo.dart';

part 'private_chat_state.dart';

class PrivateChatCubit extends Cubit<PrivateChatState> {
  PrivateChatCubit(this.chatRepo) : super(PrivateChatInitial());

  final ChatRepo chatRepo;
}
