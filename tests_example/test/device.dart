import 'package:flutter/widgets.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

extension CustomDevice on Device {
  static const Device customPhone = Device(
    name: 'customPhone',
    size: Size(300, 300),
  );
}
