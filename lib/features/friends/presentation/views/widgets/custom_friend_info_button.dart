import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_project/core/models/person_model.dart';
import 'package:new_project/core/utils/app_routes.dart';
import 'package:new_project/core/utils/colors_data.dart';
import 'package:new_project/core/widgets/custom_backgtound_container.dart';
import 'package:new_project/core/widgets/custom_elevated_button.dart';
import 'package:new_project/features/home/presentation/views/widgets/custom_cirlce_image.dart';
import 'package:new_project/features/settings/data/models/enums/colors_enums.dart';

class CustomFriendInfoButton extends StatelessWidget {
  const CustomFriendInfoButton(
      {super.key, required this.personModel,});
  final PersonModel personModel;

  @override
  Widget build(BuildContext context) {
    return CustomBackgoundContainer(
      onPressed:  () {
              GoRouter.of(context).push(AppRoutes.kProfileView, extra: personModel);
          
            }, // go to profile
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
              GoRouter.of(context).push(AppRoutes.kPrivateChateView, extra: personModel);
              // go to chat
            },
            buttonTitle: 'chat',
            buttonColor: colorAssetData(context, ColorEnum.scaffoldColor),
          )),
    );
  }
}
