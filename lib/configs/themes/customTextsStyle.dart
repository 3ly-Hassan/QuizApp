import 'package:class_app/configs/themes/colors.dart';
import 'package:class_app/configs/themes/uiParameters.dart';
import 'package:flutter/material.dart';

TextStyle cardTitlesStyle(context) => TextStyle(
    color: UIParameters.isDarkMood()
        ? Theme.of(context).textTheme.bodyText1!.color
        : Theme.of(context).primaryColor,
    fontSize: 18,
    fontWeight: FontWeight.bold);

TextStyle cardDetailsStyle(context) => TextStyle(
    color: UIParameters.isDarkMood()
        ? Colors.white
        : Theme.of(context).primaryColor,
    fontSize: 12,
    fontWeight: FontWeight.bold);

TextStyle headerText(context) => TextStyle(
    color: UIParameters.isDarkMood() ? Colors.white : onSurfaceTextColor,
    fontSize: 22,
    fontWeight: FontWeight.bold);
