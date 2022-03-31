import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_internationalization/cubit/locale_cubit.dart';
import 'package:flutter_internationalization/cubit/locale_state.dart';
import 'package:flutter_internationalization/pages/internationalization_page.dart';
import 'package:flutter_internationalization/remote_config/remote_config_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  RemoteConfigService.instance.initRemoteConfig();
  await RemoteConfigService.instance.setDefaultValues();
  await RemoteConfigService.instance.updateValues();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocaleCubit(),
      child: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: const TextTheme(
                bodyText2: TextStyle(fontSize: 30),
              ),
            ),
            locale: state.locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const InternationalizationPage(),
          );
        },
      ),
    );
  }
}
