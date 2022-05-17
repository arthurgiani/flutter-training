import 'package:flutter/material.dart';

import '../../design_system_example.dart';

final theme1 = ThemeData(
  primarySwatch: Colors.green,
  disabledColor: mediumGreyColor,
  textTheme: const TextTheme(
    button: TextStyle(color: Colors.white),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: Colors.white,
  ),
  iconTheme: const IconThemeData(
    color: Colors.green,
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
