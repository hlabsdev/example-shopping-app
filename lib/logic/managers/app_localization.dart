///@Hlabs: Exemle of call ==> [AppLocalization.of(context, 'foo')] to use only for extreme cuctomization cases
/*import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// final string = await rootBundle.loadString('assets/json/${locale.languageCode}.json');
// language = json.decode(string);
getLang(String lang) async {
  final string = await rootBundle.loadString('l10n/app_$lang.arb');
  var langText = json.decode(string);
  return langText;
}

//List of traslations
var fr = getLang('en');
var en = getLang('fr');

Map<String, Map<String, String>> _localizedValues = {
  'en': en,
  'fr': fr,
};

class AppLang {
  AppLang(this.locale);
  final Locale locale;

  */
/*
  static Future<AppLang> load(Locale locale) async {
    final String name =
        locale.countryCode!.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((b) {
      Intl.defaultLocale = localeName;
      return AppLang();
    });
  }*/ /*


  ///Custom
  String? translate(key) {
    return _localizedValues[locale.languageCode]![key];
  }

  Map<String, String>? texts() {
    return _localizedValues[locale.languageCode];
  }

  static Map<String, String>? of(BuildContext context) {
    return Localizations.of<AppLang>(context, AppLang)!.texts();
  }

*/
/*  static AppLang? of(BuildContext context) {
    return Localizations.of<AppLang>(context, AppLang);
  }*/ /*


//your list of locale here...
}

class AppLangDelegate extends LocalizationsDelegate<AppLang> {
  const AppLangDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'fr'].contains(locale.languageCode);

  */
/* @override
  Future<AppLang> load(Locale locale) {
    return AppLang.load(locale);
  }*/ /*


  @override
  Future<AppLang> load(Locale locale) {
    return SynchronousFuture<AppLang>(AppLang(locale));
  }

  @override
  bool shouldReload(AppLangDelegate old) => false;
}
*/
