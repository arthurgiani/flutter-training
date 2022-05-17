import 'package:flutter/material.dart';

import '../../design_system_example.dart';

final theme2 = ThemeData(
  primarySwatch: Colors.yellow,
  disabledColor: mediumGreyColor,
  textTheme: const TextTheme(
    button: TextStyle(color: Colors.black26),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: Colors.black26,
  ),
  iconTheme: const IconThemeData(
    color: Colors.yellow,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    fillColor: ultraLightGreyColor,
    filled: true,
    prefixIconColor: mediumGreyColor,
    suffixIconColor: mediumGreyColor,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: lightGreyColor),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: lightGreyColor),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  ),
);
