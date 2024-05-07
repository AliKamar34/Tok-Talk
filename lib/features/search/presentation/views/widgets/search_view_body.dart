import 'package:flutter/material.dart';
import 'package:new_project/features/search/presentation/views/widgets/custom_search_text_feild.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomSearchTextFeild(),
      ],
    );
  }
}
