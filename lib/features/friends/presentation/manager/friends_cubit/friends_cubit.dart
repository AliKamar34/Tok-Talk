import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/features/friends/data/repos/friends_repo.dart';
import 'package:new_project/features/home/data/models/person_model.dart';
part 'friends_state.dart';

class FriendsCubit extends Cubit<FriendsState> {
  FriendsCubit(this.friendsRepo) : super(FriendsInitial());

  final FriendsRepo friendsRepo;

  StreamSubscription? _friendsSubscription;

  void getFriends() {
    emit(FriendsLoading());

    _friendsSubscription = friendsRepo.getFriends().listen(
      (event) {
        event.fold(
          (failure) {
            emit(FriendsFailuer(errMessage: failure.errorMessage));
          },
          (friends) {
            log(friends.length.toString());
            log('message from cubit');
            emit(FriendsSuccess(friends: friends));
          },
        );
      },
    );
  }

  @override
  Future<void> close() {
    _friendsSubscription?.cancel();
    return super.close();
  }

}
