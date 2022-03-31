import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_internationalization/extensions/translate_extension.dart';

import '../components/custom_app_bar.dart';
import '../cubit/locale_cubit.dart';

class PluralPage extends StatefulWidget {
  const PluralPage({Key? key}) : super(key: key);

  @override
  _PluralPageState createState() => _PluralPageState();
}

class _PluralPageState extends State<PluralPage> {
  double currentValue = 0;
  @override
  Widget build(BuildContext context) {
    const supportedLocales = AppLocalizations.supportedLocales;
    final currentLocale = Localizations.localeOf(context);
    final localeCubit = BlocProvider.of<LocaleCubit>(context);
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'Plural',
        supportedLocales: supportedLocales,
        currentLocale: currentLocale,
        onChanged: (locale) {
          localeCubit.setLocale(locale: locale);
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.translator.pluralExample(currentValue),
            ),
            const SizedBox(height: 16),
            Slider(
              min: 0,
              max: 10,
              divisions: 10,
              value: currentValue,
              onChanged: (value) {
                setState(
                  () {
                    currentValue = value;
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
