import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension TranslateExtension on BuildContext {
  AppLocalizations get translator => AppLocalizations.of(this)!;
}
