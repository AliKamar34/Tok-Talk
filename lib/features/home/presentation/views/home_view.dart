import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_project/core/utils/colors_data.dart';
import 'package:new_project/features/friends/presentation/views/friends_view.dart';
import 'package:new_project/features/home/presentation/views/chats_view.dart';
import 'package:new_project/features/settings/data/models/enums/colors_enums.dart';
import 'package:new_project/features/settings/presentation/views/settings_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(12),
        height: 65,
        decoration: BoxDecoration(
          color: colorAssetData(context, ColorEnum.primaryColor),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 12, right: 30),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
                HapticFeedback.lightImpact();
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: SizedBox(
              width: displayWidth / 3.5,
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: index == currentIndex
                        ? displayWidth * .32
                        : displayWidth * .18,
                    alignment: Alignment.center,
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: index == currentIndex ? 50 : 0,
                      width: index == currentIndex ? displayWidth * .32 : 0,
                      decoration: BoxDecoration(
                        color: index == currentIndex
                            ? colorAssetData(context, ColorEnum.scaffoldColor)
                            : colorAssetData(context, ColorEnum.primaryColor),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Keep center alignment
                      children: [
                        Icon(
                          listOfIcons[index],
                          size: 32,
                          color: index == currentIndex
                              ? colorAssetData(
                                  context, ColorEnum.secondaryColor)
                              : Colors.white60,
                        ),
                        // Space between icon and text
                        if (index == currentIndex) const SizedBox(width: 8),
                        // Display the text only when selected
                        AnimatedOpacity(
                          opacity: index == currentIndex ? 1 : 0,
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: Text(
                            index == currentIndex ? listOfStrings[index] : '',
                            style: TextStyle(
                              color: colorAssetData(
                                  context, ColorEnum.secondaryColor),
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(child: pages[currentIndex]),
    );
  }

  List<IconData> listOfIcons = [
    FontAwesomeIcons.comments,
    // FontAwesomeIcons.userGroup,
    FontAwesomeIcons.addressBook,
    FontAwesomeIcons.gear
  ];

  List<String> listOfStrings = [
    'Chats',
    // 'Groups',
    'Friends',
    'Settings',
  ];
  List<Widget> pages = [
    const ChatsView(),
    // const GroupsChatsView(),
    const FriendsView(),
    const SettingsView(),
  ];
}
