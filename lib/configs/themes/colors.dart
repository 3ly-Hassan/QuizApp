import 'package:class_app/configs/themes/appLightTheme.dart';
import 'package:class_app/configs/themes/uiParameters.dart';
import 'package:flutter/material.dart';

import 'appDarkTheme.dart';

const Color onSurfaceTextColor = Colors.white;
const mainGradientLight = LinearGradient(
    colors: [primaryLightColor1, primaryLightColor2],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight);
const mainGradientDark = LinearGradient(
    colors: [primaryDarkColor1, primaryDarkColor2],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight);
LinearGradient mainGradient() =>
    UIParameters.isDarkMood() ? mainGradientDark : mainGradientLight;

Color customScaffoldColor(BuildContext context) {
  return UIParameters.isDarkMood()
      ? const Color.fromARGB(255, 20, 46, 158)
      : const Color.fromARGB(255, 240, 237, 255);
}
