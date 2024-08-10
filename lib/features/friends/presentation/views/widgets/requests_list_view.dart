
import 'package:flutter/material.dart';
import 'package:new_project/features/friends/presentation/views/widgets/custom_requests_info_button.dart';
import 'package:new_project/features/home/data/models/person_model.dart';

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
