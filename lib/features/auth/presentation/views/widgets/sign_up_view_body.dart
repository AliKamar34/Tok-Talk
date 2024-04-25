import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:new_project/core/utils/app_routes.dart';
import 'package:new_project/core/utils/assets_data.dart';
import 'package:new_project/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:new_project/features/auth/presentation/views/widgets/custom_text_feild.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          AspectRatio(aspectRatio: 3 / 1, child: Image.asset(AssetsData.logo)),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Welcome',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomTextField(
            label: 'Name',
            hint: 'write your name',
            icon: Icon(
              FontAwesomeIcons.user,
              size: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const CustomTextField(
            label: 'Email',
            hint: 'write your email',
            icon: Icon(
              FontAwesomeIcons.envelope,
              size: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const CustomTextField(
            label: 'password',
            hint: 'write your password',
            icon: Icon(
              FontAwesomeIcons.eye,
              size: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const CustomTextField(
            label: 'confirm password',
            hint: 'confirm your password',
            icon: Icon(
              FontAwesomeIcons.eye,
              size: 16,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          CustomButton(
            title: 'Sign Up',
            onPressed: () {
              GoRouter.of(context).push(AppRoutes.kHomeView);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRoutes.kSignInView);
              },
              child: const Text('Already have account , Log in!'),
            ),
          ),
        ],
      ),
    );
  }
}
