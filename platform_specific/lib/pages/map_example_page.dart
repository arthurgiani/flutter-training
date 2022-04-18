import 'dart:developer';

import 'package:flutter/material.dart';

import '../platform_channel_handler.dart';

class MapExamplePage extends StatefulWidget {
  const MapExamplePage({Key? key}) : super(key: key);

  @override
  _MapExamplePageState createState() => _MapExamplePageState();
}

class _MapExamplePageState extends State<MapExamplePage> {
  Map<String, int>? map;

  final platformChannelHandler = PlatformChannelHandler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (map == null) const Text('get map'),
            if (map != null) Text(map!.toString()),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () async {
                try {
                  final result = await platformChannelHandler.getMap();
                  setState(() {
                    map = result;
                  });
                } catch (error) {
                  log(error.toString());
                }
              },
              child: const Text('Get Map'),
            )
          ],
        ),
      ),
    );
  }
}
