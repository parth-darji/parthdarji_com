class App {
  final String imagePath;
  final String appName;
  final void Function() onTap;

  App({
    required this.imagePath,
    required this.appName,
    required this.onTap,
  });
}
