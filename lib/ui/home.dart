import 'package:astrotalk/helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'tabs_home/home_tabs.dart';
import '../helper/constants.dart';
import '../provider/home_provider.dart';
import '../widgets/bottom_navbar_items.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // tabs
  int tabIndex = 2;
  final HomeTab _home = const HomeTab();
  final TalkTab _talk = const TalkTab();
  final QuestionTab _quiz = const QuestionTab();
  final ReportTab _report = const ReportTab();
  final ChatTab _chat = const ChatTab();

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _initCategories();
    _pages = [_home, _talk, _quiz, _report, _chat];
  }

  void _initCategories() {
    var pro = Provider.of<HomeProvider>(context, listen: false);
    pro.getQuizCategories();
  }

  @override
  Widget build(BuildContext context) {
    //initializing size config for entire App
    SizeConfig().init(context);
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.segment,
            color: theme.primaryColor,
          ),
        ),
        title: Center(
          child: Image.asset(
            iconLogo,
            height: kTextTabBarHeight,
          ),
        ),
        elevation: 0.0,
        actions: [
          ElevatedButton(
            onPressed: _onProfilePressed,
            child: Image.asset(iconProfile),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              elevation: 0.0,
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(15.00),
            ),
          )
        ],
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          //statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.white,
      ),
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          return _pages[provider.tabIndex];
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        showSelectedLabels: true,
        elevation: 20,
        unselectedLabelStyle: const TextStyle(color: Colors.grey, fontSize: 12),
        currentIndex: tabIndex,
        selectedItemColor: Colors.amber[800],
        selectedLabelStyle: const TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
        items: getBottomNavBarItems(),
        onTap: (index) {
          setState(() {
            var pro = Provider.of<HomeProvider>(context, listen: false);
            pro.changeIndex(index);
            tabIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void _onProfilePressed() {
    Navigator.of(context).pushNamed(routeProfile);
  }
}
