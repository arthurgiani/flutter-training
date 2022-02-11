import 'package:flutter/material.dart';

class CounterChangeNotifier extends ChangeNotifier {
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }
}
