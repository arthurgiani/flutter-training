import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

extension CustomDevice on Device {
  static const Device smartWatch = Device(
    size: Size(200, 200),
    name: 'smartWatch',
  );
}
