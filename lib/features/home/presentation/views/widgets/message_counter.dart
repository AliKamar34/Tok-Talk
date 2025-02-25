import 'package:flutter/material.dart';
import 'package:new_project/core/utils/colors_data.dart';
import 'package:new_project/features/settings/data/models/enums/colors_enums.dart';

class MessageCounter extends StatelessWidget {
  const MessageCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color:colorAssetData(context,ColorEnum.scaffoldColor),
      ),
      child: const Center(child: Text('1')),
    );
  }
}
