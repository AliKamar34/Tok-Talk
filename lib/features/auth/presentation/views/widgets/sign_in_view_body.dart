import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:new_project/core/utils/app_routes.dart';
import 'package:new_project/core/utils/assets_data.dart';
import 'package:new_project/core/widgets/custom_loading_indicator.dart';
import 'package:new_project/core/widgets/custom_snack_bar.dart';
import 'package:new_project/features/auth/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:new_project/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:new_project/features/auth/presentation/views/widgets/custom_text_feild.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey();
    bool isLoading = false;
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LogInLoading) {
          isLoading = true;
        } else if (state is LogInSuccess) {
          isLoading = false;

          
          GoRouter.of(context).push(AppRoutes.kBottomNavigationBarView);
        } else if (state is LogInFailuer) {
          isLoading = false;
          showSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        String? email;
        String? password;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                AspectRatio(
                    aspectRatio: 3 / 1, child: Image.asset(AssetsData.logo)),
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
                CustomTextField(
                  label: 'Email',
                  hint: 'write your email',
                  icon: const Icon(
                    FontAwesomeIcons.envelope,
                    size: 16,
                  ),
                  onChanged: (value) {
                    email = value;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  label: 'password',
                  hint: 'write your password',
                  icon: const Icon(
                    FontAwesomeIcons.eye,
                    size: 16,
                  ),
                  onChanged: (value) {
                    password = value;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                CustomButton(
                  widget: isLoading
                      ? const CustomLoadingIndicator()
                      : const Text('LOG IN'),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<AuthBloc>(context).add(
                        LogInEvent(email: email!, password: password!),
                      );
                    }
                  },
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
              ],
            ),
          ),
        );
      },
    );
  }
}
