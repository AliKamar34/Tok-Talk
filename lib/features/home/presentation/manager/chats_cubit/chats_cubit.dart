import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/features/home/data/models/person_model.dart';
import 'package:new_project/features/home/data/repos/home_repo.dart';

part 'chats_state.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit(this.homeRepo) : super(ChatsInitial());

  final HomeRepo homeRepo;

  Future<void> getChats() async {
    emit(ChatsLoading());
    var result = await homeRepo.getChats();
    result.fold((failuer) {
      emit(ChatsFailuer(errMessage: failuer.errorMessage));
    }, (chats) {
      emit(ChatsSuccess(persons: chats));
    });
  }
}
