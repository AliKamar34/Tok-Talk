import 'package:flutter/material.dart';

class SlideingText extends StatelessWidget {
  const SlideingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: const Text(
              'C H A T ',
              textAlign: TextAlign.center,
            ),
          );
        });
  }
}
