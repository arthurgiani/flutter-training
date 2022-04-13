import 'package:flutter/services.dart';

class PlatformChannelHandler {
  final MethodChannel methodChannel = const MethodChannel(
    'test_method_channel',
  );

  Future<int> getBatteryLevel() async {
    final result = await methodChannel.invokeMethod<int>('getBattery');
    return result ?? 0;
  }

  Future<String> getWelcomeMessage() async {
    final result = await methodChannel.invokeMethod<String>(
      'getWelcomeMessage',
      {"name": "rafael"},
    );
    return result ?? '';
  }

  Future<String> getWelcomeMessageError() async {
    final result = await methodChannel.invokeMethod<String>(
      'getWelcomeMessage',
    );
    return result ?? '';
  }

  Future<List<int>> getIntList() async {
    final result = await methodChannel.invokeListMethod<int>('int_list');
    return result ?? [];
  }
}
