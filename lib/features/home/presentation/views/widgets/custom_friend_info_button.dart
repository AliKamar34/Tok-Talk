import 'package:flutter/material.dart';
import 'package:new_project/core/utils/colors_data.dart';
import 'package:new_project/core/widgets/custom_backgtound_container.dart';
import 'package:new_project/core/widgets/custom_elevated_button.dart';
import 'package:new_project/features/home/data/models/person_model.dart';
import 'package:new_project/features/home/presentation/views/widgets/custom_cirlce_image.dart';

class CustomFriendInfoButton extends StatelessWidget {
  const CustomFriendInfoButton(
      {super.key, required this.personModel, this.onPressed});
  final PersonModel personModel;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return CustomBackgoundContainer(
      onPressed: onPressed, // go to profile
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
              // go to chat 
            },
            buttonTitle: 'chat',
            buttonColor: ColorAssetData.kScaffoldColor,
          )),
    );
  }
}
