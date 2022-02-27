import 'package:astrotalk/ui/profile.dart';
import 'package:flutter/material.dart';

import '../helper/constants.dart';
import '../ui/home.dart';

class RouteManager {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeHome:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case routeProfile:
        return MaterialPageRoute(builder: (context) => const Profile());
      default:
        return MaterialPageRoute(builder: (context) => Container());
    }
  }
}
