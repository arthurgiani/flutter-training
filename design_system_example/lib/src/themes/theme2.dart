import 'package:design_system_example/design_system_example.dart';
import 'package:flutter/material.dart';

final theme2 = ThemeData(
  primarySwatch: Colors.blue,
  disabledColor: const Color(0xff868686),
  iconTheme: const IconThemeData(color: Colors.blue),
  textTheme: const TextTheme(
    button: TextStyle(color: Colors.white),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.resolveWith(
        (states) {
          return const TextStyle(color: Colors.blue, fontSize: 10);
        },
      ),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: ultraLightGreyColor,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: lightGreyColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: lightGreyColor),
    ),
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
  ),
);
