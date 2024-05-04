part of 'chats_cubit.dart';

abstract class ChatsState extends Equatable {
  const ChatsState();

  @override
  List<Object> get props => [];
}

final class ChatsInitial extends ChatsState {}

final class ChatsLoading extends ChatsState {}

final class ChatsSuccess extends ChatsState {
  final List<PersonModel> persons;

  const ChatsSuccess({required this.persons});
}

final class ChatsFailuer extends ChatsState {
  final String errMessage;

  const ChatsFailuer({required this.errMessage});
}
