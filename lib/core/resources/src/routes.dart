part of resources;

class Routes {
  static String splash = "splash";
  static String login = "login";
  static String home = "home";
}

final Map<String, Widget Function(BuildContext)> routes = {
  Routes.splash: (context) => const SplashScreen(),
  Routes.login: (context) => const LoginScreen(),
};