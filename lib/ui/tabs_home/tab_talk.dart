import 'package:flutter/material.dart';

import '../../helper/constants.dart';
import '../../widgets/tab_title.dart';

class TalkTab extends StatelessWidget {
  const TalkTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: BottomTitle(label: "Talk", iconPath: iconTalk),
    );
  }
}
