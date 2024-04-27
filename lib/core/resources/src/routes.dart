part of resources;

class Routes {
  static String splash = "splash";
  static String hello = "hello";
  static String languageSelection = "languageSelection";
  static String login = "login";
  static String home = "home";
}

final Map<String, Widget Function(BuildContext)> routes = {
  Routes.splash: (context) => const SplashScreen(),
  Routes.hello: (context) => const HelloScreen(),
  Routes.languageSelection: (context) => const LanguageSelectionScreen(),
  Routes.login: (context) => const LoginScreen(),
  Routes.home: (context) => const HomeScreen(),
};
