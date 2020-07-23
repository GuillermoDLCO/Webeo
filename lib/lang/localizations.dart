import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:webeoapp/l10n/messages_all.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) async {
    final String localeName = locale.countryCode == null || locale.countryCode.isEmpty ? locale.languageCode : locale.toString();

    final String canonicalLocaleName = Intl.canonicalizedLocale(localeName);
    await initializeMessages(canonicalLocaleName);
    Intl.defaultLocale = canonicalLocaleName;

    return AppLocalizations();
  }

  static AppLocalizations of(BuildContext context) => Localizations.of<AppLocalizations>(context, AppLocalizations);

  // * Login screen

  String get login => Intl.message('Login', name: 'login');
  String get writePin => Intl.message('Write Pin', name: 'writePin');
  String get pin => Intl.message('Pin', name: 'pin');
  String get loginInstructions => Intl.message('Login Instructions', name: 'loginInstructions');
  String get emailHelper => Intl.message('Email Helper', name: 'emailHelper');
  String get email => Intl.message('Email', name: 'email');
  String get phone => Intl.message('Phone', name: 'phone');

  // * Generals
  
  String get information => Intl.message('Information', name: 'information');
  String get warning => Intl.message('Warning', name: 'warning');
  String get alert => Intl.message('Alert', name: 'alert');
  String get next => Intl.message('Next', name: 'next');
  String get done => Intl.message('Done', name: 'done');
  String get finish => Intl.message('Finish', name: 'finish');
  String get accept => Intl.message('Accept', name: 'accept');
  String get optional => Intl.message('Optional', name: 'optional');
  String get cancel => Intl.message('Cancel', name: 'cancel');
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es', 'pt'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}
