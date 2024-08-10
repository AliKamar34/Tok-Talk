part of 'friends_cubit.dart';

sealed class FriendsState extends Equatable {
  const FriendsState();

  @override
  List<Object> get props => [];
}

final class FriendsInitial extends FriendsState {}

final class FriendsLoading extends FriendsState {}

final class FriendsSuccess extends FriendsState {
  final List<PersonModel> friends;

  const FriendsSuccess({required this.friends});
}

final class FriendsFailuer extends FriendsState {
  final String errMessage;

  const FriendsFailuer({required this.errMessage});
}
