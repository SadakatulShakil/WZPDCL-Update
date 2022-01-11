
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wzpdcl_app_flutter/language/LanguagesBn.dart';
import 'package:wzpdcl_app_flutter/language/LanguagesEn.dart';
import 'Languages .dart';



class AppLocalizationsDelegate extends LocalizationsDelegate<Languages> {

 // const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'bn'].contains(locale.languageCode);

  @override
  Future<Languages> load(Locale locale) => _load(locale);

  static Future<Languages> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return LanguageEn();
      case 'bn':
        return LanguageBn();
      default:
        return LanguageEn();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Languages> old) => false;

}
