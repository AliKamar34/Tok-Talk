import 'package:flutter/material.dart';
import 'package:new_project/core/utils/colors_data.dart';
import 'package:new_project/features/home/data/models/person_model.dart';
import 'package:new_project/features/home/presentation/views/widgets/custom_cirlce_image.dart';
import 'package:new_project/features/home/presentation/views/widgets/message_counter.dart';

class CustomChatInfoButton extends StatelessWidget {
  const CustomChatInfoButton({
    super.key,
    required this.onPressed,
    required this.personModel,
  });
  final PersonModel personModel;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
        right: 12,
        bottom: 6,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorAssetData.kprimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
        ),
        child: Row(
          children: [
            Expanded(
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
              ),
            ),
            const Column(
              children: [
                Text('today'),
                MessageCounter(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
