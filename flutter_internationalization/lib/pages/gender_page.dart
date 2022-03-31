import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_internationalization/extensions/translate_extension.dart';

import '../components/custom_app_bar.dart';
import '../cubit/locale_cubit.dart';

class GenderPage extends StatefulWidget {
  const GenderPage({Key? key}) : super(key: key);

  @override
  _GenderPageState createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
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
              context.translator.genderExample('femubisaiusabijsab'),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
