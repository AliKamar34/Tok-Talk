import 'package:flutter/material.dart';
import 'package:new_project/features/search/presentation/views/widgets/custom_search_text_feild.dart';
import 'package:new_project/features/search/presentation/views/widgets/search_result_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSearchTextFeild(),
        SizedBox(
          height: 10,
        ),
        Text(
          '   search Results ',
          style: TextStyle(fontSize: 22),
        ),
        SizedBox(
          height: 8,
        ),
        Expanded(child: SearchResultListView()),
      ],
    );
  }
}
