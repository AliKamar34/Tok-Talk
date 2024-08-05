import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:new_project/core/utils/colors_data.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const LoadingIndicator(
      indicatorType: Indicator.ballPulse,
      colors: [
        ColorAssetData.kSecondaryColor,
      ],
      strokeWidth: 0.23,
      pathBackgroundColor: Colors.black,
    );
  }
}
