import 'package:flutter/material.dart';

import '../../helper/constants.dart';
import '../../widgets/tab_title.dart';

class ChatTab extends StatelessWidget {
  const ChatTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: BottomTitle(label: "Chat", iconPath: iconChat),
    );
  }
}
