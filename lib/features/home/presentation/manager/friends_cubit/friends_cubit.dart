import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:new_project/features/home/data/models/person_model.dart';
import 'package:new_project/features/home/data/repos/home_repo.dart';

part 'friends_state.dart';

class FriendsCubit extends Cubit<FriendsState> {
  FriendsCubit(this.homeRepo) : super(FriendsInitial());

  final HomeRepo homeRepo;

  Future<void> getFriends() async {
    emit(FriendsLoading());
    var result = await homeRepo.getFriends();
    result.fold((failuer) {
      emit(FriendsFailuer(errMessage: failuer.errorMessage));
    }, (friends) {
      emit(FriendsSuccess(friends: friends));
    });
  }
}
