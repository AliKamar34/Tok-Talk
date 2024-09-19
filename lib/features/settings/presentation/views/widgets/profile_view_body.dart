
import 'package:flutter/material.dart';
import 'package:new_project/core/models/person_model.dart';
import 'package:new_project/features/home/presentation/views/widgets/custom_cirlce_image.dart';
import 'package:new_project/features/settings/presentation/views/widgets/custom_profile_info_container.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key, required this.personModel});
  final PersonModel personModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            child: Column(
              children: [
                Flexible(
                  child: SizedBox(
                    width: 250,
                    child: CustomCircleImage(
                      imageUrl: personModel.image,
                    ),
                  ),
                ),
               
                Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    CustomProfileInfoContainer(
                      title: 'Name',
                      subTitle: personModel.name,
                      icon: Icons.account_circle,
                    ),
                    CustomProfileInfoContainer(
                      title: 'Email',
                      subTitle: personModel.email,
                      icon: Icons.email,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
