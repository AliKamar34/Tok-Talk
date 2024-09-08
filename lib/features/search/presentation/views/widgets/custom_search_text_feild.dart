
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:new_project/core/utils/colors_data.dart';
import 'package:new_project/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:new_project/features/settings/data/models/enums/colors_enums.dart';

class CustomSearchTextFeild extends StatelessWidget {
  const CustomSearchTextFeild({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onSubmitted: (value) {
          BlocProvider.of<SearchCubit>(context).searchFriend(personName: value);
          //cubit method
        },
        decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: const Icon(Icons.close)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          hintText: 'Serach',
          filled: true,
          fillColor: colorAssetData(context,ColorEnum.primaryColor),
          enabledBorder: buildOutLineBorder(context),
          focusedBorder: buildOutLineBorder(context),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutLineBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide:  BorderSide(
        color: colorAssetData(context,ColorEnum.primaryColor),
      ),
    );
  }
}
