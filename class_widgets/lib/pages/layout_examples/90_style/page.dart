import 'package:flutter/material.dart';

class StylePage extends StatelessWidget {
  const StylePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff913CF0),
      appBar: AppBar(
        backgroundColor: const Color(0xff913CF0),
        actions: const [
          Center(
            child: Text('Skip'),
          ),
          SizedBox(
            width: 10,
          )
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: const [
            BodyContentWidget(),
            SiginEmailButtonWidget(),
          ],
        ),
      ),
    );
  }
}

class SiginEmailButtonWidget extends StatelessWidget {
  const SiginEmailButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Color(0xff3CC9D7),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: const Center(
        child: Text(
          "Signup with Email",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}

class BodyContentWidget extends StatelessWidget {
  const BodyContentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 45),
        const Text(
          '90s style',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        const SizedBox(height: 37),
        const Text(
          '90s Nostalgia gifts & Merchandise',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        const SizedBox(
          height: 144,
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/style-image.png',
            ),
          ),
        )
      ],
    );
  }
}
