import 'package:flutter/material.dart';

import '../../../../main.dart';
import '../../local_storage/local_storage.dart';
import '../localization.dart';

class Localization {
  static Localization? _instance;

  Localization._internal();

  static Localization get instance {
    _instance ??= Localization._internal();
    return _instance!;
  }

  Locale? currentLanguage;

  Future<Locale> setLocale(String languageCode) async {
    await HiveDataManager.saveData<String>(
      hiveBox: HiveBox.user,
      key: HiveKeyManager.preferredLanguage,
      value: languageCode,
    );
    return _locale(languageCode);
  }

  Future<Locale> getLocale() async {
    String? preferredLanguage = await HiveDataManager.getData<String>(
      hiveBox: HiveBox.user,
      key: HiveKeyManager.preferredLanguage,
    );
    return _locale(
        preferredLanguage ?? Languages.of(LanguageConstant.code).english);
  }

  Locale _locale(String languageCode) {
    if (languageCode.isNotEmpty) {
      return Locale(languageCode);
    } else {
      return Locale(Languages.of(LanguageConstant.code).english);
    }
  }

  void changeLanguage(BuildContext context, String selectedLanguageCode) async {
    Locale locale = await setLocale(selectedLanguageCode);
    if (context.mounted) {
      App.setLocale(context, locale);
    }
  }
}
