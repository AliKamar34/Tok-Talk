import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:new_project/core/errors/failuer_error.dart';
import 'package:new_project/core/utils/user_collection_data.dart';
import 'package:new_project/features/home/data/models/person_model.dart';
import 'package:new_project/features/search/data/repos/search_repo.dart';

class SearchRepoImpl extends SearchRepo {
  @override
  Future<Either<Failure, List<PersonModel>>> searchForFriend(
      {required String personName}) async {
    CollectionReference users = FirebaseFirestore.instance
        .collection(UserCollectionData.userCollectionName);
    try {
      List<PersonModel> searchData = [];
      var result = await users
          .where(UserCollectionData.userName, isEqualTo: personName)
          .get();

      for (var element in result.docs) {
        searchData.add(PersonModel.fromjson(element));
      }
      return right(searchData);
    } catch (e) {
      return left(FirebaseExceptionFailure(e.toString()));
    }
  }
}
