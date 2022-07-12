import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:platform_specific/components/person.dart';

class PlatformChannelHandler {
  final MethodChannel methodChannel = const MethodChannel(
    'test_method_channel',
  );

  final EventChannel eventChannel = const EventChannel('channel.test');

  Future<int> getBatteryLevel() async {
    final result = await methodChannel.invokeMethod<int>('getBattery');
    return result!;
  }

  Future<String> getWelcomeMessage() async {
    final result = await methodChannel.invokeMethod<String>(
      'getWelcomeMessage',
      {"name": "rafael"},
    );
    return result!;
  }

  Future<String> getWelcomeMessageError() async {
    final result = await methodChannel.invokeMethod<String>(
      'getWelcomeMessage',
    );
    return result!;
  }

  Future<List<int>> getIntList() async {
    final result = await methodChannel.invokeListMethod<int>('int_list');
    return result!;
  }

  Future<Map<String, int>> getMap() async {
    final result =
        await methodChannel.invokeMapMethod<String, int>('map_example');
    return result!;
  }

  Future<List<Person>> getPersons() async {
    final result = await methodChannel.invokeMethod<String>('json_example');
    final List mapResult = jsonDecode(result!);
    final persons = mapResult.map((person) => Person.fromMap(person)).toList();
    return persons;
  }

  Stream<int> getRandomNumberStream() {
    final result = eventChannel.receiveBroadcastStream();
    return result.map<int>((event) => event);
  }
}
