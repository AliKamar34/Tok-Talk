part of 'private_chat_cubit.dart';

sealed class PrivateChatState extends Equatable {
  const PrivateChatState();

  @override
  List<Object> get props => [];
}

final class PrivateChatInitial extends PrivateChatState {}

final class PrivateChatLoading extends PrivateChatState {}

final class PrivateChatSuccess extends PrivateChatState {
  final List<MessageModel> messages;

  const PrivateChatSuccess({required this.messages});
}

final class PrivateChatFailure extends PrivateChatState {
  final String errMessage;

  const PrivateChatFailure({required this.errMessage});
}
