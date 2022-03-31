import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/widgets.dart';

class RemoteConfigService {
  late FirebaseRemoteConfig firebaseRemoteConfig;

  RemoteConfigService._();
  static final RemoteConfigService _singleton = RemoteConfigService._();
  static RemoteConfigService get instance => _singleton;

  void initRemoteConfig() {
    firebaseRemoteConfig = FirebaseRemoteConfig.instance;
  }

  Map<String, dynamic> defaultValuesMap = {
    "first_string": "default first",
    "second_string": "default second",
    "third_string": "default third"
  };

  Future<void> setDefaultValues() async {
    await firebaseRemoteConfig.setDefaults(defaultValuesMap);
  }

  Future<void> updateValues() async {
    await firebaseRemoteConfig.fetchAndActivate();
  }

  String getlocalizedValue({
    required Locale locale,
    required String key,
  }) {
    final data = firebaseRemoteConfig.getString(locale.toString());
    final bool isDefaultValuesStillValid = data.isEmpty;
    if (isDefaultValuesStillValid) {
      return defaultValuesMap[key];
    }
    final Map<String, dynamic> map = jsonDecode(data);
    return map[key] ?? '';
  }
}
