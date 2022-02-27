import 'package:astrotalk/helper/size_config.dart';
import 'package:flutter/material.dart';

import '../helper/constants.dart';

List<BottomNavigationBarItem> getBottomNavBarItems() {
  return <BottomNavigationBarItem>[
    // home
    BottomNavigationBarItem(
      icon: Image.asset(
        "assets/home.png",
        width: SizeConfig.fitToWidth(24),
        height: SizeConfig.fitToHeight(24),
        color: Constants.greyColor,
      ),
      activeIcon: Image.asset(
        "assets/home.png",
        width: SizeConfig.fitToWidth(24),
        height: SizeConfig.fitToHeight(24),
        color: Constants.lightTheme.primaryColor,
      ),
      label: "Home",
    ),
    // talk
    BottomNavigationBarItem(
      icon: Image.asset(
        "assets/talk.png",
        width: SizeConfig.fitToWidth(24),
        height: SizeConfig.fitToHeight(24),
      ),
      activeIcon: Image.asset(
        "assets/talk.png",
        width: SizeConfig.fitToWidth(24),
        height: SizeConfig.fitToHeight(24),
        color: Constants.lightTheme.primaryColor,
      ),
      label: 'Talk',
    ),
    // ask
    BottomNavigationBarItem(
      icon: Image.asset(
        "assets/ask.png",
        width: SizeConfig.fitToWidth(24),
        height: SizeConfig.fitToHeight(24),
      ),
      activeIcon: Image.asset(
        "assets/ask.png",
        width: SizeConfig.fitToWidth(24),
        height: SizeConfig.fitToHeight(24),
        color: Constants.lightTheme.primaryColor,
      ),
      label: 'Ask Question',
    ),
    // report
    BottomNavigationBarItem(
      icon: Image.asset(
        "assets/reports.png",
        width: SizeConfig.fitToWidth(24),
        height: SizeConfig.fitToHeight(24),
      ),
      activeIcon: Image.asset(
        "assets/reports.png",
        width: SizeConfig.fitToWidth(24),
        height: SizeConfig.fitToHeight(24),
        color: Constants.lightTheme.primaryColor,
      ),
      label: 'Reports',
    ),
    // chat
    BottomNavigationBarItem(
      icon: Image.asset(
        "assets/chat.png",
        width: SizeConfig.fitToWidth(24),
        height: SizeConfig.fitToHeight(24),
      ),
      activeIcon: Image.asset(
        "assets/chat.png",
        width: SizeConfig.fitToWidth(24),
        height: SizeConfig.fitToHeight(24),
        color: Constants.lightTheme.primaryColor,
      ),
      label: 'Chat',
    ),
  ];
}
