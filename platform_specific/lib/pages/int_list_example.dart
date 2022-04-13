import 'dart:developer';

import 'package:flutter/material.dart';

import '../platform_channel_handler.dart';

class IntListExamplePage extends StatefulWidget {
  const IntListExamplePage({Key? key}) : super(key: key);

  @override
  _IntListExamplePageState createState() => _IntListExamplePageState();
}

class _IntListExamplePageState extends State<IntListExamplePage> {
  final platformChannelHandler = PlatformChannelHandler();
  List<int> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (list.isEmpty) const Text('Get List'),
            if (list.isNotEmpty)
              ListView.separated(
                separatorBuilder: (_, index) => const SizedBox(height: 8),
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (_, index) {
                  final item = list[index];
                  return ListTile(
                    title: Text(item.toString()),
                    tileColor: Colors.grey.shade300,
                  );
                },
              ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () async {
                try {
                  final result = await platformChannelHandler.getIntList();
                  setState(() {
                    list = result;
                  });
                } catch (error) {
                  log(error.toString());
                }
              },
              child: const Text('Get Int List'),
            )
          ],
        ),
      ),
    );
  }
}
