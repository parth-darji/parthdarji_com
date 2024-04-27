import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:parthdarji_com/core/resources/resources.dart';
import 'package:parthdarji_com/features/splash/splash.dart';

import 'core/init/init.dart';
import 'core/services/local_storage/local_storage.dart';
import 'core/services/localization/localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseInit.initialize();
  await SupabaseInit.initialize();
  await HiveDataManager.initialize();
  runApp(const App());
}

class App extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_AppState>();

    state?.setLocale(newLocale);
  }

  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  void setLocale(Locale locale) {
    setState(() {
      Localization.instance.currentLanguage = locale;
    });
  }

  @override
  void initState() {
    super.initState();
    Localization.instance.changeLanguage(context, "en");
  }

  @override
  void didChangeDependencies() async {
    Localization.instance.getLocale().then((locale) {
      setState(() {
        Localization.instance.currentLanguage = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'parthdarji.com',
      theme: const CupertinoThemeData(),
      home: const SplashScreen(),
      initialRoute: Routes.splash,
      routes: routes,
      supportedLocales: const [
        Locale('en', ''),
        Locale('sw', ''),
      ],
      locale: Localization.instance.currentLanguage,
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode &&
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
    );
  }
}
