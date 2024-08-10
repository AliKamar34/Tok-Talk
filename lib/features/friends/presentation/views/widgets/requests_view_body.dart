import 'package:flutter/material.dart';
import 'package:new_project/features/friends/presentation/views/widgets/requests_list_view.dart';
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
