import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/core/utils/colors_data.dart';
import 'package:new_project/core/widgets/custom_backgtound_container.dart';
import 'package:new_project/core/widgets/custom_elevated_button.dart';
import 'package:new_project/features/home/data/models/person_model.dart';
import 'package:new_project/features/home/presentation/views/widgets/custom_cirlce_image.dart';
import 'package:new_project/features/search/presentation/manager/search_cubit/search_cubit.dart';

class CustomSearchInfoButton extends StatelessWidget {
  const CustomSearchInfoButton(
      {super.key, required this.personModel, this.onPressed});

  final PersonModel personModel;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return CustomBackgoundContainer(
      onPressed: onPressed,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CustomCircleImage(
          imageUrl: personModel.image,
        ),
        title: Text(
          personModel.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(personModel.email),
        trailing: CustomElevateButton(
          onPressed: () {
            BlocProvider.of<SearchCubit>(context)
                .searchRepo
                .addFriend(personEmail: personModel.email);
          },
          buttonTitle: 'send request',
          buttonColor: ColorAssetData.kScaffoldColor,
        ),
      ),
    );
  }
}
