import 'package:flutter/material.dart';

class BigMacPage extends StatelessWidget {
  const BigMacPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff09400F),
      appBar: AppBar(
        backgroundColor: const Color(0xff09400F),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Big Mac',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Monument-Extended',
            ),
          ),
          const SizedBox(height: 48),
          Image.asset(
            'assets/images/big-mac.png',
            height: 250,
          ),
          const Text(
            'Nutritional Information',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Monument-Extended',
            ),
          ),
          const SizedBox(height: 46),
          Padding(
            padding: const EdgeInsets.only(left: 52, right: 32),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    NutritionalInformationWidget(
                      qtdCalories: '550',
                      text: 'Calories',
                    ),
                    SizedBox(height: 36),
                    NutritionalInformationWidget(
                      qtdCalories: '45G',
                      text: 'Total Carbs',
                    )
                  ],
                ),
                const SizedBox(
                  width: 70,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    NutritionalInformationWidget(
                      qtdCalories: '550',
                      text: 'Calories',
                    ),
                    SizedBox(height: 36),
                    NutritionalInformationWidget(
                      qtdCalories: '45G',
                      text: 'Total Calories',
                    ),
                  ],
                ),
                const SizedBox(
                  width: 16,
                ),
                const RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    'CALCULATOR',
                    style: TextStyle(
                      color: Color(0xffEDB432),
                      fontSize: 11,
                      fontFamily: 'Monument-Extended',
                    ),
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 34),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xffEDB432),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.all(24),
              child: const Center(
                child: Text(
                  'VIEW INGREDIENTS & ALLERGENS',
                  style: TextStyle(
                    fontSize: 11,
                    fontFamily: 'Monument-Extended',
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class NutritionalInformationWidget extends StatelessWidget {
  final String qtdCalories;
  final String text;
  const NutritionalInformationWidget(
      {Key? key, required this.qtdCalories, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          qtdCalories,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontFamily: 'Monument-Extended'),
        ),
        const SizedBox(height: 10),
        Text(
          text,
          style: const TextStyle(
              color: Color(0xff687C6B),
              fontSize: 10,
              fontFamily: 'Monument-Extended'),
        ),
      ],
    );
  }
}
