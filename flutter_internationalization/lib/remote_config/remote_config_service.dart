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

  Map<String, dynamic> cachedMap = {
    "first_string": "default first",
    "second_string": "default second",
    "third_string": "default third",
  };

  Future<void> setDefaultValue() async {
    await firebaseRemoteConfig.setDefaults(cachedMap);
  }

  Future<void> updateValue() async {
    await firebaseRemoteConfig.fetchAndActivate();
  }

  String getLocalizedValue({
    required Locale locale,
    required String key,
  }) {
    final localeString = locale.toString();
    final data = firebaseRemoteConfig.getString(localeString);
    if (data.isEmpty) {
      return cachedMap[key];
    }
    final Map<String, dynamic> decodedJson = jsonDecode(data);
    return decodedJson[key];
  }
}
