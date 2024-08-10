import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/core/widgets/custom_loading_indicator.dart';
import 'package:new_project/features/friends/data/repos/friends_repo_impl.dart';
import 'package:new_project/features/friends/presentation/manager/friends_cubit/friends_cubit.dart';
import 'package:new_project/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:new_project/features/search/presentation/views/widgets/custom_Search_info_button.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return ListView.builder(
            itemCount: state.searchResult.length,
            itemBuilder: (context, index) {
              return BlocProvider(
                create: (context) => FriendsCubit(FriendsRepoImpl()),
                child: CustomSearchInfoButton(
                  personModel: state.searchResult[index],
                  onPressed: () {},
                ),
              );
            },
          );
        } else if (state is SearchFailuer) {
          return Center(
            child: Text(state.errMessage),
          );
        } else if (state is SearchLoading) {
          return const Center(child: CustomLoadingIndicator());
        } else {
          return const Center(
            child: Text('Search'),
          );
        }
      },
    );
  }
}
