
import 'package:flutter/material.dart';
import 'package:new_project/core/utils/colors_data.dart';
import 'package:new_project/features/settings/data/models/enums/colors_enums.dart';

class PrivateChatTextFeild extends StatelessWidget {
  const PrivateChatTextFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        maxLines: 4,
        minLines: 1,
        onChanged: (value) {},
        decoration: InputDecoration(
          fillColor: colorAssetData(context, ColorEnum.primaryColor),
          filled: true,
          isDense: true,
          prefixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.camera_alt),
          ),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Transform.rotate(
              angle: -35 * (3.1415926535897932 / 180),
              child: Icon(
                Icons.send_rounded,
                color: colorAssetData(context, ColorEnum.scaffoldColor),
                size: 26,
              ),
            ),
          ),
          hintText: 'Write a Message',
          hintStyle: const TextStyle(color: Colors.white),
          enabledBorder: customBorder(),
          border: customBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder customBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none,
    );
  }
}
