part of 'groups_cubit.dart';

sealed class GroupsState extends Equatable {
  const GroupsState();

  @override
  List<Object> get props => [];
}

final class GroupsInitial extends GroupsState {}

final class GroupsLoading extends GroupsState {}

final class GroupsSuccess extends GroupsState {
  final List<GroupModel> groups;

  const GroupsSuccess({required this.groups});
}

final class GroupsFailuer extends GroupsState {
  final String errMessage;

  const GroupsFailuer({required this.errMessage});
}
