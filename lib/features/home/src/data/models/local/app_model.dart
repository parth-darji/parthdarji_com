class AppModel {
  final String imagePath;
  final String appName;
  final void Function() onTap;

  AppModel({
    required this.imagePath,
    required this.appName,
    required this.onTap,
  });
}
