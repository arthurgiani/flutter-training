import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_internationalization/remote_config/remote_config_service.dart';

extension TranslateExtension on BuildContext {
  AppLocalizations get translator => AppLocalizations.of(this)!;
}

extension RemoteConfigExtension on String {
  String i18n({required Locale locale}) {
    return RemoteConfigService.instance.getLocalizedValue(
      locale: locale,
      key: this,
    );
  }
}
