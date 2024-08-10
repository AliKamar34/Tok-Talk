import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/core/utils/colors_data.dart';
import 'package:new_project/core/widgets/custom_backgtound_container.dart';
import 'package:new_project/core/widgets/custom_elevated_button.dart';
import 'package:new_project/features/friends/presentation/manager/friends_cubit/friends_cubit.dart';
import 'package:new_project/features/friends/presentation/views/widgets/custom_friend_info_button.dart';
import 'package:new_project/features/friends/presentation/views/widgets/custom_requests_info_button.dart';
import 'package:new_project/features/home/data/models/person_model.dart';
import 'package:new_project/features/home/presentation/views/widgets/custom_cirlce_image.dart';

class RequestsViewBody extends StatelessWidget {
  const RequestsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 25, left: 20),
          child: Text(
            'Requests',
            style: TextStyle(fontSize: 26),
          ),
        ),
        Expanded(child: RequestsListView()),
      ],
    );
  }
}

class RequestsListView extends StatelessWidget {
  const RequestsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return CustomRequestsInfoButton(
          personModel: PersonModel(
            email: 'ali@gmail.com',
            name: 'ali',
            image: 'https://en.m.wikipedia.org/wiki/File:Sample_User_Icon.png',
          ),
          onPressed: () {},
        );
      },
    );
  }
}

