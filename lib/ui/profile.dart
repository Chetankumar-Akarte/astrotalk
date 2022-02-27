import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../helper/constants.dart';
import 'tab_profile/my_profile.dart';
import 'tab_profile/order_history.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(iconLogo, height: kTextTabBarHeight),
          elevation: 0.0,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.00),
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Logout", style: TextStyle(color: theme.primaryColor)),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.00),
                    side: BorderSide(color: theme.primaryColor),
                  ),
                ),
              ),
            )
          ],
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: Colors.white,
          bottom: TabBar(
            tabs: const [
              Tab(child: Text("My Profile")),
              Tab(child: Text("Order History")),
            ],
            labelColor: theme.primaryColor,
            unselectedLabelColor: Colors.grey,
          ),
        ),
        body: const TabBarView(
          children: [
            MyProfile(),
            OrderHistory(),
          ],
        ),
      ),
    );
  }
}
