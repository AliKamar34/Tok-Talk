import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/features/friends/data/repos/friends_repo.dart';
import 'package:new_project/features/home/data/models/person_model.dart';

part 'requests_state.dart';

class RequestsCubit extends Cubit<RequestsState> {
  RequestsCubit(this.friendsRepo) : super(RequestsInitial());

  final FriendsRepo friendsRepo;

    StreamSubscription? _friendsSubscription;
    
     

 void getRequests() {
    emit(RequesLoading());

    _friendsSubscription = friendsRepo.getRequests().listen(
      (event) {
        event.fold(
          (failure) {
            emit(RequestsFailuer(errMessage: failure.errorMessage));
          },
          (requests) {
            log(requests.length.toString());
            log('message from cubit');
            emit(RequestsSuccess(requests: requests));
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
