import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:new_project/core/utils/app_routes.dart';
import 'package:new_project/core/utils/assets_data.dart';
import 'package:new_project/features/splash/presentation/views/widgets/sliding_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    navigationView();
    initAnimation();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: Image.asset(AssetsData.logo),
        ),
        const SizedBox(
          height: 6,
        ),
        SlideingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    slidingAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0, 7))
            .animate(animationController);

    animationController.forward();
  }

  void navigationView() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (FirebaseAuth.instance.currentUser != null) {
          GoRouter.of(context).push(AppRoutes.kBottomNavigationBarView);
        } else {
          GoRouter.of(context).push(AppRoutes.kSignInView);
        }
      },
    );
  }
}
