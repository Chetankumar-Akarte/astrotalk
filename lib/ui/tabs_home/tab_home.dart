import 'package:flutter/material.dart';

import '../../helper/constants.dart';
import '../../widgets/tab_title.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: BottomTitle(label: "Home", iconPath: iconHome),
    );
  }
}
