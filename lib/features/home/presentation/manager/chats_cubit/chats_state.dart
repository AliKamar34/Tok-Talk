part of 'chats_cubit.dart';

abstract class ChatsState extends Equatable {
  const ChatsState();

  @override
  List<Object> get props => [];
}

final class ChatsInitial extends ChatsState {}

final class ChatsLoading extends ChatsState {}

final class ChatsSuccess extends ChatsState {
  final List<ChatModel> chats;

  const ChatsSuccess({required this.chats});
  
  @override
  List<Object> get props => [chats];
}

final class ChatsFailuer extends ChatsState {
  final String errMessage;

  const ChatsFailuer({required this.errMessage});
}
