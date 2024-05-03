import 'package:flutter/widgets.dart';
import 'package:new_project/features/home/presentation/views/widgets/chats_info_list_view.dart';
import 'package:new_project/features/home/presentation/views/widgets/custom_app_bar.dart';

class ChatsViewBody extends StatelessWidget {
  const ChatsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBar(),
        Expanded(
          child: ChatsInfoListView(),
        ),
      ],
    );
  }
}
