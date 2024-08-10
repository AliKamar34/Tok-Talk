import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/features/friends/presentation/manager/friends_cubit/friends_cubit.dart';
import 'package:new_project/features/friends/presentation/views/widgets/custom_requests_info_button.dart';
import 'package:new_project/features/home/data/models/person_model.dart';

class RequestsListView extends StatelessWidget {
  const RequestsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FriendsCubit, FriendsState>(
      builder: (context, state) {
       if(state is RequestsSuccess){
         return ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return CustomRequestsInfoButton(
              personModel: PersonModel(
                email: 'ali@gmail.com',
                name: 'ali',
                image:
                    'https://en.m.wikipedia.org/wiki/File:Sample_User_Icon.png',
              ),
              onPressed: () {},
            );
          },
        );
       }
       else if (state is RequestsFailuer) {
          return Text(state.errMessage);
        } else if (state is RequesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FriendsInitial){
          return const Text('initial state');
        } else{
           return const Text(' state');
        }
      },
    );
  }
}
