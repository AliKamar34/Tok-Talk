import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:new_project/features/home/data/models/group_model.dart';
import 'package:new_project/features/home/data/repos/home_repo.dart';

part 'groups_state.dart';

class GroupsCubit extends Cubit<GroupsState> {
  GroupsCubit(this.homeRepo) : super(GroupsInitial());

  final HomeRepo homeRepo;

  Future<void> getGroups() async {
    emit(GroupsLoading());
    var result = await homeRepo.getGroups();
    result.fold((failure) {
      emit(GroupsFailuer(errMessage: failure.errorMessage));
    }, (groups) {
      emit(GroupsSuccess(groups: groups));
    });
  }
}
