import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_internationalization/extensions/translate_extension.dart';

import '../components/custom_app_bar.dart';
import '../cubit/locale_cubit.dart';

class CurrencyPage extends StatefulWidget {
  const CurrencyPage({Key? key}) : super(key: key);

  @override
  _CurrencyPageState createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  @override
  Widget build(BuildContext context) {
    const supportedLocales = AppLocalizations.supportedLocales;
    final currentLocale = Localizations.localeOf(context);
    final localeCubit = BlocProvider.of<LocaleCubit>(context);
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'Currency',
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
              context.translator.currencyExample(80),
            ),
          ],
        ),
      ),
    );
  }
}
