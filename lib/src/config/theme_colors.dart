import 'package:flutter/material.dart';

Map<int, Color> _swatchOpacity = {
  50: const Color.fromRGBO(126, 113, 245, .1),
  100: const Color.fromRGBO(126, 113, 245, .2),
  200: const Color.fromRGBO(126, 113, 245, .3),
  300: const Color.fromRGBO(126, 113, 245, .4),
  400: const Color.fromRGBO(126, 113, 245, .5),
  500: const Color.fromRGBO(126, 113, 245, .6),
  600: const Color.fromRGBO(126, 113, 245, .7),
  700: const Color.fromRGBO(126, 113, 245, .8),
  800: const Color.fromRGBO(126, 113, 245, .9),
  900: const Color.fromRGBO(126, 113, 245, 1),
};

abstract class CustomColors {
  static Color customContrastColor = Colors.red.shade700;
  static Color customContrastColor2 = const Color.fromARGB(255, 120, 174, 218);
  static Color customContrastColorLogo = Colors.indigo;

  static MaterialColor customSwathColor =
      MaterialColor(0xFF7D79D0, _swatchOpacity);
}
