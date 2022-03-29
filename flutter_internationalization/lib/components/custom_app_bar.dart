import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({
    Key? key,
    required this.titleText,
    required this.currentLocale,
    required this.supportedLocales,
    required this.onChanged,
  }) : super(key: key);

  final String titleText;
  final Locale currentLocale;
  final List<Locale> supportedLocales;
  final Function(Locale) onChanged;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titleText),
      actions: [
        DropdownButton<Locale>(
          value: currentLocale,
          items: supportedLocales
              .map(
                (locale) => DropdownMenuItem<Locale>(
                  value: locale,
                  child: Text(
                    '${locale.languageCode} ${locale.countryCode ?? ''}',
                  ),
                ),
              )
              .toList(),
          onChanged: (locale) {
            onChanged(locale!);
          },
        )
      ],
    );
  }

  @override
  Widget get child => const SizedBox();

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
