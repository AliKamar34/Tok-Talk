import 'package:flutter/material.dart';
import 'package:new_project/core/widgets/custom_backgtound_container.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 24,
        ),
        CustomBackgoundContainer(
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Profile',
                  style: TextStyle(fontSize: 18),
                ),
                RotatedBox(
                    quarterTurns: 2,
                    child: Icon(Icons.arrow_back_ios_new_outlined))
              ],
            ),
          ),
        ),
        CustomBackgoundContainer(
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'dark mode',
                  style: TextStyle(fontSize: 18),
                ),
                RotatedBox(
                    quarterTurns: 2,
                    child: Icon(Icons.arrow_back_ios_new_outlined))
              ],
            ),
          ),
        ),
        const Expanded(child: SizedBox()),
        CustomBackgoundContainer(
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.all(15),
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Log out',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
