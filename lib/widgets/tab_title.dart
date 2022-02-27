import 'package:flutter/material.dart';

class BottomTitle extends StatelessWidget {
  final String label;
  final String iconPath;

  const BottomTitle({
    Key? key,
    required this.label,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(iconPath, width: 50.00, height: 50.00),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(label,
              style: TextStyle(
                  color: false ? theme.primaryColor : Colors.black54,
                  fontSize: 20.00),
              textAlign: TextAlign.center),
        ),
      ],
    );
  }
}
