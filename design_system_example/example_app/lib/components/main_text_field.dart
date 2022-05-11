import 'package:flutter/material.dart';

class MainTextField extends StatelessWidget {
  const MainTextField({
    Key? key,
    required this.placeholder,
    required this.textEditingController,
    required this.onTraillingTapped,
    this.isObscure = false,
    this.leading,
    this.trailing,
  }) : super(key: key);

  final String placeholder;
  final TextEditingController textEditingController;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback onTraillingTapped;
  final bool isObscure;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      obscureText: isObscure,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        hintText: placeholder,
        prefixIcon: leading,
        suffixIcon: trailing != null
            ? GestureDetector(
                child: trailing,
                onTap: onTraillingTapped,
              )
            : null,
      ),
    );
  }
}
