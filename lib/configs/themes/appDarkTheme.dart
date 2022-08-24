import 'package:class_app/configs/themes/subThemeDataMixin.dart';
import 'package:flutter/material.dart';

const Color primaryDarkColor1 = Color(0xFF2e3c62);
const Color primaryDarkColor2 = Color(0xFF99ace1);
const Color mainTextColorDark = Color.fromARGB(255, 40, 40, 40);

class DarkTheme with SubThemeData {
  buildDarkTheme() {
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
      iconTheme: getIconTheme(),
      textTheme: getTextThemes().apply(
        bodyColor: mainTextColorDark,
        displayColor: mainTextColorDark,
      ),
    );
  }
}
