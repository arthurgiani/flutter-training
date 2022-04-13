import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:platform_specific/platform_channel_handler.dart';

class GetBatteryLevelPage extends StatefulWidget {
  const GetBatteryLevelPage({Key? key}) : super(key: key);

  @override
  _GetBatteryLevelPageState createState() => _GetBatteryLevelPageState();
}

class _GetBatteryLevelPageState extends State<GetBatteryLevelPage> {
  String batteryLevel = '';
  final platformChannelHandler = PlatformChannelHandler();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (batteryLevel.isEmpty) const Text('Get battery level'),
            if (batteryLevel.isNotEmpty) Text('$batteryLevel%'),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () async {
                try {
                  final result = await platformChannelHandler.getBatteryLevel();
                  setState(() {
                    batteryLevel = result.toString();
                  });
                } catch (error) {
                  log(error.toString());
                }
              },
              child: const Text('Get Battery Level'),
            )
          ],
        ),
      ),
    );
  }
}
