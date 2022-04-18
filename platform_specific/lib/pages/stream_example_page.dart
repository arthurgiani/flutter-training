import 'package:flutter/material.dart';
import 'package:platform_specific/platform_channel_handler.dart';

class StreamExamplePage extends StatefulWidget {
  const StreamExamplePage({Key? key}) : super(key: key);

  @override
  _StreamExamplePageState createState() => _StreamExamplePageState();
}

class _StreamExamplePageState extends State<StreamExamplePage> {
  final PlatformChannelHandler platformChannelHandler =
      PlatformChannelHandler();

  Stream<int>? randomNumberStream;

  @override
  void initState() {
    randomNumberStream = platformChannelHandler.getRandomNumberStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<int>(
              stream: randomNumberStream,
              builder: (context, snapshot) {
                return Text(
                  snapshot.data.toString(),
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
