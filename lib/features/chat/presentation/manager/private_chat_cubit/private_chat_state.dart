part of 'private_chat_cubit.dart';

sealed class PrivateChatState extends Equatable {
  const PrivateChatState();

  @override
  List<Object> get props => [];
}

final class PrivateChatInitial extends PrivateChatState {}
