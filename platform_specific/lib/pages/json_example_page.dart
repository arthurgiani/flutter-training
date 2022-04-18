import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:platform_specific/components/person.dart';

import '../platform_channel_handler.dart';

class JsonExamplePage extends StatefulWidget {
  const JsonExamplePage({Key? key}) : super(key: key);

  @override
  _JsonExamplePageState createState() => _JsonExamplePageState();
}

class _JsonExamplePageState extends State<JsonExamplePage> {
  final platformChannelHandler = PlatformChannelHandler();
  List<Person>? list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (list == null) const Text('Get Persons'),
            if (list != null)
              Expanded(
                child: ListView.builder(
                  itemCount: list!.length,
                  itemBuilder: (_, index) {
                    final item = list![index];
                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text(item.age.toString()),
                    );
                  },
                ),
              ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () async {
                try {
                  final result = await platformChannelHandler.getPersons();
                  setState(() {
                    list = result;
                  });
                } catch (error) {
                  log(error.toString());
                }
              },
              child: const Text('Get Persons'),
            )
          ],
        ),
      ),
    );
  }
}
