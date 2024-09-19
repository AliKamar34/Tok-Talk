import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/core/utils/colors_data.dart';
import 'package:new_project/core/widgets/custom_backgtound_container.dart';
import 'package:new_project/core/widgets/custom_elevated_button.dart';
import 'package:new_project/core/widgets/custom_snack_bar.dart';
import 'package:new_project/features/friends/presentation/manager/requests_cubit/requests_cubit.dart';
import 'package:new_project/core/models/person_model.dart';
import 'package:new_project/features/home/presentation/views/widgets/custom_cirlce_image.dart';
import 'package:new_project/features/settings/data/models/enums/colors_enums.dart';

class CustomRequestsInfoButton extends StatelessWidget {
  const CustomRequestsInfoButton(
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
            BlocProvider.of<RequestsCubit>(context)
                .friendsRepo
                .acceptRequest(personModel: personModel);

            showSnackBar(context, 'Requests Accepted');
          },
          buttonTitle: 'accept',
          buttonColor:colorAssetData(context,ColorEnum.scaffoldColor),
        ),
      ),
    );
  }
}
