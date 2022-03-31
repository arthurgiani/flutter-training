import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../components/custom_app_bar.dart';
import '../cubit/locale_cubit.dart';

class DirectionalityPage extends StatefulWidget {
  const DirectionalityPage({Key? key}) : super(key: key);

  @override
  _DirectionalityPageState createState() => _DirectionalityPageState();
}

class _DirectionalityPageState extends State<DirectionalityPage> {
  @override
  Widget build(BuildContext context) {
    const supportedLocales = AppLocalizations.supportedLocales;
    final currentLocale = Localizations.localeOf(context);
    final localeCubit = BlocProvider.of<LocaleCubit>(context);
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'Directionalty',
        supportedLocales: supportedLocales,
        currentLocale: currentLocale,
        onChanged: (locale) {
          localeCubit.setLocale(locale: locale);
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          _WrongCardWidget(),
          _CorrectCardWidget(),
        ],
      ),
    );
  }
}

class _WrongCardWidget extends StatelessWidget {
  const _WrongCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade300,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 32),
            height: 100,
            width: 100,
            color: Colors.black,
          ),
          const Expanded(
            child: Text('Wrong Margin Card'),
          ),
        ],
      ),
    );
  }
}

class _CorrectCardWidget extends StatelessWidget {
  const _CorrectCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade300,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsetsDirectional.only(end: 32),
            height: 100,
            width: 100,
            color: Colors.black,
          ),
          const Expanded(
            child: Text('Correct Margin Card'),
          ),
        ],
      ),
    );
  }
}
