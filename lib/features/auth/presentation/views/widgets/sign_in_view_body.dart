import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:new_project/core/utils/app_routes.dart';
import 'package:new_project/core/utils/assets_data.dart';
import 'package:new_project/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:new_project/features/auth/presentation/views/widgets/custom_text_feild.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(aspectRatio: 3 / 1, child: Image.asset(AssetsData.logo)),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Welcome Back ',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          customTextField(
            label: 'Email',
            hint: 'write your email',
            icon: const Icon(
              FontAwesomeIcons.envelope,
              size: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          customTextField(
            label: 'password',
            hint: 'write your password',
            icon: const Icon(
              FontAwesomeIcons.eye,
              size: 16,
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          CustomButton(
            title: 'LOG IN',
            onPressed: () {},
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRoutes.kSignUpView);
              },
              child: const Text('Dont have account , create one!'),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
