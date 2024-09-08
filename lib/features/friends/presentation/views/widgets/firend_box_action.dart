import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_project/core/utils/app_routes.dart';
import 'package:new_project/core/utils/colors_data.dart';
import 'package:new_project/features/settings/data/models/enums/colors_enums.dart';

class FriendBoxAction extends StatelessWidget {
  const FriendBoxAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            GoRouter.of(context).push(AppRoutes.kSearchView);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.all(8),
          ),
          child:  Text(
            'Search',
            style: TextStyle(color: colorAssetData(context,ColorEnum.secondaryColor)),
          ),
        ),
        ElevatedButton(
          onPressed: () {
             GoRouter.of(context).push(AppRoutes.kRequestsView);
             
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.all(8),
          ),
          child:  Text(
            'Requests',
            style: TextStyle(color: colorAssetData(context,ColorEnum.secondaryColor)),
          ),
        ),
      ],
    );
  }
}
