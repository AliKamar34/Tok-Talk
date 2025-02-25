import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/features/friends/presentation/manager/friends_cubit/friends_cubit.dart';
import 'package:new_project/features/friends/presentation/manager/requests_cubit/requests_cubit.dart';
import 'package:new_project/features/friends/presentation/views/widgets/custom_requests_info_button.dart';
import 'package:new_project/core/models/person_model.dart';

class RequestsListView extends StatelessWidget {
  const RequestsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestsCubit, RequestsState>(
      builder: (context, state) {
        if (state is RequestsSuccess) {
          return state.requests.isEmpty
              ? const Center(child: Text('You Have No Requests'))
              : ListView.builder(
                  itemCount: state.requests.length,
                  itemBuilder: (context, index) {
                    return CustomRequestsInfoButton(
                      personModel: PersonModel(
                        email: state.requests[index].email,
                        name: state.requests[index].name,
                        image: state.requests[index].image,
                      ),
                      onPressed: () {},
                    );
                  },
                );
        } else if (state is RequestsFailuer) {
          return Text(state.errMessage);
        } else if (state is RequesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FriendsInitial) {
          return const Text('initial state');
        } else {
          return const Text(' state');
        }
      },
    );
  }
}
