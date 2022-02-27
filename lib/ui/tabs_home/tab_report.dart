import 'package:flutter/material.dart';

import '../../helper/constants.dart';
import '../../widgets/tab_title.dart';

class ReportTab extends StatelessWidget {
  const ReportTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: BottomTitle(label: "Reports", iconPath: iconReport),
    );
  }
}
