import 'package:flutter/material.dart';
import 'package:new_project/features/friends/presentation/views/widgets/requests_view_body.dart';

class RequestsView extends StatelessWidget {
  const RequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RequestsViewBody(),
    );
  }
}
