import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:new_project/features/home/data/models/person_model.dart';
import 'package:new_project/features/search/data/repos/search_repo.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  final SearchRepo searchRepo;
  Future<void> searchFriend({required String personName}) async {
    if (personName == '') {
      emit(SearchInitial());
    } else {
      emit(SearchLoading());
    }

    var result = await searchRepo.searchForFriend(personName: personName);
    result.fold((failuer) {
      emit(SearchFailuer(errMessage: failuer.errorMessage));
    }, (searchResult) {
      emit(SearchSuccess(searchResult: searchResult));
    });
  }
}
