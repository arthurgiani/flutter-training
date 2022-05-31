import 'package:flutter/material.dart';

class CounterNotifier extends ValueNotifier<int> {
  CounterNotifier() : super(0);
  void increment() {
    value++;
  }
}
