import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_internationalization/components/custom_app_bar.dart';
import 'package:flutter_internationalization/cubit/locale_cubit.dart';

import '../extensions/translate_extension.dart';

class VariableStringPage extends StatefulWidget {
  const VariableStringPage({Key? key}) : super(key: key);

  @override
  _VariableStringPageState createState() => _VariableStringPageState();
}

class _VariableStringPageState extends State<VariableStringPage> {
  @override
  Widget build(BuildContext context) {
    const supportedLocales = AppLocalizations.supportedLocales;
    final currentLocale = Localizations.localeOf(context);
    final localeCubit = BlocProvider.of<LocaleCubit>(context);
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'Hello World',
        supportedLocales: supportedLocales,
        currentLocale: currentLocale,
        onChanged: (locale) {
          localeCubit.setLocale(locale: locale);
        },
      ),
      body: Center(
        child: Text(context.translator.fakeUsername('Foo')),
      ),
    );
  }
}
