import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/shared_pref.dart';

class LocalizationCubit extends Cubit<Locale> {
  final SharedPref sharedPref;

  LocalizationCubit({required this.sharedPref})
      : super(Locale(sharedPref.languageCode));

  void changeLanguage(Locale locale) {
    sharedPref.setLanguageCode(locale.toString());
    emit(locale);
  }
}
