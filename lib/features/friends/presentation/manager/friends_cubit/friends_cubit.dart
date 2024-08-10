import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:new_project/features/friends/data/repos/friends_repo.dart';
import 'package:new_project/features/home/data/models/person_model.dart';
part 'friends_state.dart';

class FriendsCubit extends Cubit<FriendsState> {
  FriendsCubit(this.friendsRepo) : super(FriendsInitial());

  final FriendsRepo friendsRepo;

  Future<void> getFriends() async {
    emit(FriendsLoading());
    var result = await friendsRepo.getFriends();
    result.fold((failuer) {
      emit(FriendsFailuer(errMessage: failuer.errorMessage));
    }, (friends) {
      emit(FriendsSuccess(friends: friends));
    });
  }
}
