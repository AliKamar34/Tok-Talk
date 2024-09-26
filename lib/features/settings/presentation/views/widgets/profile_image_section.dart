import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_project/core/utils/colors_data.dart';
import 'package:new_project/core/widgets/custom_snack_bar.dart';
import 'package:new_project/features/home/presentation/views/widgets/custom_cirlce_image.dart';
import 'package:new_project/features/settings/data/models/enums/colors_enums.dart';
import 'package:new_project/features/settings/presentation/manager/setting_cubit/settings_cubit.dart';

class ProfileImageSection extends StatelessWidget {
  const ProfileImageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CustomCircleImage(
            imageUrl: FirebaseAuth.instance.currentUser!.photoURL ?? '',
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: IconButton(
              onPressed: () {
                BlocProvider.of<SettingsCubit>(context)
                    .settingsRepo
                    .removeProfileImage();

                showSnackBar(context, 'image removed');
              },
              icon: Icon(
                FontAwesomeIcons.trash,
                color: colorAssetData(context, ColorEnum.iconColor),
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
