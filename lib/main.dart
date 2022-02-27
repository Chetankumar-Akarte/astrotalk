import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/app_provider.dart';
import 'provider/home_provider.dart';
import 'provider/profile_provider.dart';
import 'route/route_manager.dart';
import 'ui/home.dart';

void main() {
  //NetworkService.create();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(create: (context) => HomeProvider()),
        ChangeNotifierProvider<ProfileProvider>(create: (context) => ProfileProvider()),
      ],
      child: MaterialApp(
        title: 'AstroTalk',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: const HomeScreen(),
        onGenerateRoute: RouteManager.onGenerateRoute,
      ),
    );
  }
}
