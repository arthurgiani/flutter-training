import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:platform_specific/components/person.dart';
import 'package:platform_specific/platform_channel_handler.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late final MethodChannel methodChannel;
  late PlatformChannelHandler platformChannelHandler;

  setUpAll(() {
    methodChannel = const MethodChannel('test_method_channel');
    methodChannel.setMockMethodCallHandler((call) async {
      if (call.method == 'getBattery') {
        return 30;
      }
      if (call.method == 'json_example') {
        return "[{\"name\":\"rafael\", \"age\":20}, {\"name\":\"arthur\", \"age\":20}]";
      }
    });
  });

  setUp(() {
    platformChannelHandler = PlatformChannelHandler();
  });

  test('getBattery', () async {
    //Act
    final result = await platformChannelHandler.getBatteryLevel();

    //Assert
    expect(result, 30);
  });

  test('getPersons', () async {
    //Act
    final result = await platformChannelHandler.getPersons();

    //Assert
    expect(result, isA<List<Person>>());
  });
}
