import 'package:flutter/material.dart';

import '../../config/theme_colors.dart';
class AppNameWidget extends StatelessWidget {
  final Color? titleColor;
  final double textSize;

  const AppNameWidget({
    Key? key,
    this.titleColor,
    this.textSize = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
          fontSize: textSize,
        ),
        children: [
          TextSpan(
            text: 'Loja',
            style: TextStyle(
              color: titleColor ?? CustomColors.customContrastColorLogo,
            ),
          ),
          TextSpan(
            text: 'Nicolau',
            style: TextStyle(
              color: CustomColors.customContrastColor2,
            ),
          ),
        ],
      ),
    );
  }
}