import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_project/core/models/person_model.dart';
import 'package:new_project/core/utils/app_routes.dart';
import 'package:new_project/core/utils/colors_data.dart';
import 'package:new_project/core/widgets/custom_backgtound_container.dart';
import 'package:new_project/features/home/presentation/views/widgets/custom_cirlce_image.dart';
import 'package:new_project/features/settings/data/models/enums/colors_enums.dart';

class PrivateChatAppBar extends StatelessWidget {
  const PrivateChatAppBar({super.key, required this.personModel});
  final PersonModel personModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRoutes.kProfileView, extra: personModel);
      },
      child: Container(
        color: colorAssetData(context, ColorEnum.primaryColor),
        height: 48,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              CustomBackgoundContainer(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                child: Row(
                  children: [
                    const Icon(Icons.arrow_back_ios_new_rounded),
                    SizedBox(
                      height: 50,
                      child: CustomCircleImage(imageUrl: personModel.image),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                personModel.name,
                style: const TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
