import 'package:flutter/material.dart';

class MainTextField extends StatelessWidget {
  const MainTextField({
    Key? key,
    required this.textController,
    this.leading,
    this.trailling,
    this.onTraillingPressed,
    this.isObscure = false,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController textController;
  final Widget? leading;
  final Widget? trailling;
  final VoidCallback? onTraillingPressed;
  final bool isObscure;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      obscureText: isObscure,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: leading,
        suffixIcon: trailling != null
            ? GestureDetector(child: trailling, onTap: onTraillingPressed)
            : null,
      ),
    );
  }
}
