import 'package:flutter/services.dart';

class PlatformHandler {
  final MethodChannel methodChannel = const MethodChannel('platform.specific');

  Future<int> getBatteryLevel() async {
    final int result = await methodChannel.invokeMethod('getBatteryLevel');
    return result;
  }

  Future<String> getWelcomeMessage() async {
    final String result =
        await methodChannel.invokeMethod('getHelloString', {"user": "any"});
    return result;
  }

  Future<String> getWelcomeMessageWithError() async {
    final String result = await methodChannel.invokeMethod('getHelloString');
    return result;
  }

  Future<String> tryLaunchUnexistentPlugin() async {
    final String result = await methodChannel.invokeMethod('unexistent method');
    return result;
  }

  Future<List<int>> getIntList() async {
    final result =
        await methodChannel.invokeListMethod<int>('int_list_example');
    return result ?? [];
  }

  Future<Map<String, dynamic>> getMap() async {
    final result =
        await methodChannel.invokeMapMethod<String, dynamic>('map_example');
    return result ?? {};
  }

  Future<String> getJson() async {
    final String result = await methodChannel.invokeMethod('json_example');
    return result;
  }
}
