part of resources;

class Routes {
  static String splash = "splash";
  static String hello = "hello";
  static String languageSelection = "languageSelection";
  static String login = "login";
  static String password = "password";
  static String youAreOneStepAway = "youAreOneStepAway";
  static String home = "home";
}

final Map<String, Widget Function(BuildContext)> routes = {
  Routes.splash: (context) => const SplashScreen(),
  Routes.hello: (context) => const HelloScreen(),
  Routes.languageSelection: (context) => const LanguageSelectionScreen(),
  Routes.login: (context) => const LoginScreen(),
  Routes.password: (context) => const PasswordScreen(),
  Routes.youAreOneStepAway: (context) => const YouAreOneStepAwayScreen(),
  Routes.home: (context) => const HomeScreen(),
};
