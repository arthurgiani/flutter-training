import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../platform_channel_handler.dart';

class MethodWithParameters extends StatefulWidget {
  const MethodWithParameters({Key? key}) : super(key: key);

  @override
  _MethodWithParametersState createState() => _MethodWithParametersState();
}

class _MethodWithParametersState extends State<MethodWithParameters> {
  String welcomeMessage = '';
  final platformChannelHandler = PlatformChannelHandler();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (welcomeMessage.isEmpty) const Text('Get Welcome Message'),
            if (welcomeMessage.isNotEmpty) Text(welcomeMessage),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () async {
                try {
                  final result =
                      await platformChannelHandler.getWelcomeMessage();
                  setState(() {
                    welcomeMessage = result;
                  });
                } catch (error) {
                  log(error.toString());
                }
              },
              child: const Text(
                'Get Welcome Message',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  final result =
                      await platformChannelHandler.getWelcomeMessageError();
                  setState(() {
                    welcomeMessage = result;
                  });
                } on PlatformException catch (error) {
                  setState(() {
                    welcomeMessage = error.message ?? 'Error';
                  });
                }
              },
              child: const Text('Get Welcome Message Error'),
            )
          ],
        ),
      ),
    );
  }
}
