import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../components/custom_app_bar.dart';
import '../cubit/locale_cubit.dart';
import '../extensions/translate_extension.dart';

class RemoteConfigPage extends StatefulWidget {
  const RemoteConfigPage({Key? key}) : super(key: key);

  @override
  _RemoteConfigPageState createState() => _RemoteConfigPageState();
}

class _RemoteConfigPageState extends State<RemoteConfigPage> {
  @override
  Widget build(BuildContext context) {
    const supportedLocales = AppLocalizations.supportedLocales;
    final currentLocale = Localizations.localeOf(context);
    final localeCubit = BlocProvider.of<LocaleCubit>(context);
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'Remote Config',
        supportedLocales: supportedLocales,
        currentLocale: currentLocale,
        onChanged: (locale) {
          localeCubit.setLocale(locale: locale);
        },
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "first_string".i18n(locale: currentLocale),
            ),
            Text(
              "second_string".i18n(locale: currentLocale),
            ),
            Text(
              "third_string".i18n(locale: currentLocale),
            ),
          ],
        ),
      ),
    );
  }
}
