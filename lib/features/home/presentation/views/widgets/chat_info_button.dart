import 'package:flutter/material.dart';
import 'package:new_project/core/utils/colors_data.dart';
import 'package:new_project/features/home/presentation/views/widgets/custom_cirlce_image.dart';

class CustomChatInfoButton extends StatelessWidget {
  const CustomChatInfoButton({super.key, required this.onPressed});

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
          padding: const EdgeInsets.symmetric(horizontal: 8),
        ),
        child: const ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CustomCircleImage(),
          title: Text('ali kamar'),
          subtitle: Text('hello'),
        ),
      ),
    );
  }
}

