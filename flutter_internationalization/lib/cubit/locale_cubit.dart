import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_internationalization/cubit/locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleState());

  void setLocale({required Locale locale}) {
    emit(LocaleState(locale: locale));
  }
}
