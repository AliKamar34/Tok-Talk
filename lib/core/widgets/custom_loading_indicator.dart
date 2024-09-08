import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:new_project/core/utils/colors_data.dart';
import 'package:new_project/features/settings/data/models/enums/colors_enums.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  LoadingIndicator(
      indicatorType: Indicator.ballScale,
      colors: [
       colorAssetData(context,ColorEnum.secondaryColor),
      ],
      strokeWidth: 0.23,
      pathBackgroundColor: Colors.black,
    );
  }
}
