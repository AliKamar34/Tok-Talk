import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/core/widgets/custom_loading_indicator.dart';
import 'package:new_project/features/home/presentation/views/widgets/custom_friend_info_button.dart';
import 'package:new_project/features/search/presentation/manager/search_cubit/search_cubit.dart';

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
              return CustomFriendInfoButton(
                personModel:state.searchResult[index],
                onPressed: () {},
              );
            },
          );
        } else if (state is SearchFailuer) {
          return Center(
            child: Text(state.errMessage),
          );
        } else if (state is SearchLoading) {
          return const CustomLoadingIndicator();
        } else {
          return const Center(
            child: Text('Search'),
          );
        }
      },
    );
  }
}
