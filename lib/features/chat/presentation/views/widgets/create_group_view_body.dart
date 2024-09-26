import 'package:flutter/widgets.dart';
import 'package:new_project/features/home/presentation/views/widgets/custom_cirlce_image.dart';

class CreateGroupViewBody extends StatelessWidget {
  const CreateGroupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomCircleImage(imageUrl: ''),
      ],
    );
  }
}
