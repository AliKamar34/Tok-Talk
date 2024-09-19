import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/core/utils/chats_collection_data.dart';
import 'package:new_project/core/utils/friends_collection_data.dart';
import 'package:new_project/core/utils/user_collection_data.dart';
import 'package:new_project/features/friends/data/repos/friends_repo.dart';
import 'package:new_project/features/home/data/models/person_model.dart';

part 'requests_state.dart';

class RequestsCubit extends Cubit<RequestsState> {
  RequestsCubit(this.friendsRepo) : super(RequestsInitial());

  final FriendsRepo friendsRepo;

//     StreamSubscription? _friendsSubscription;

//  void getRequests() {
//     emit(RequesLoading());

//     _friendsSubscription = friendsRepo.getRequests().listen(
//       (event) {
//         event.fold(
//           (failure) {
//             emit(RequestsFailuer(errMessage: failure.errorMessage));
//           },
//           (requests) {
//             log(requests.length.toString());
//             log('message from cubit');
//             emit(RequestsSuccess(requests: requests));
//           },
//         );
//       },
//     );
//   }

//   @override
//   Future<void> close() {
//     _friendsSubscription?.cancel();
//     return super.close();
//   }

  getRequests() {
    emit(RequesLoading());
    CollectionReference requests = FirebaseFirestore.instance
        .collection(UserCollectionData.userCollectionName)
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection(FriendCollentionData.friendCollectionName)
        .doc('${FirebaseAuth.instance.currentUser!.email} Friends')
        .collection(FriendCollentionData.userFriendRequestsCollectionData);
try {
      requests
     .orderBy(ChatsCollectionData.messagesPersonName, descending: true)
        .snapshots()
          .listen(
        (event) {
          List<PersonModel> requestsList =
              event.docs.map((doc) => PersonModel.fromjson(doc)).toList();
          emit(RequestsSuccess(requests: requestsList));
        },
      );
    } catch (e) {
      emit(RequestsFailuer(errMessage: e.toString()));
    }
  }
}
