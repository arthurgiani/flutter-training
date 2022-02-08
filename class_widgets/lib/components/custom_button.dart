import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Widget nextWidget;

  const CustomButton({
    Key? key,
    required this.label,
    required this.nextWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(label, textAlign: TextAlign.center),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(200, 40),
        maximumSize: const Size(200, 200),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextWidget),
        );
      },
    );
  }
}
