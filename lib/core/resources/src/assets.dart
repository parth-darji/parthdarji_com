part of resources;

class AssetPath {
  static const String _imagesPath = "assets/images/";
  static const String _animationPath = "assets/animation/";
  static const String _fontsPath = "assets/fonts/";
  static const String _svgPath = "assets/svg/";

  static String image(String fileName) => "$_imagesPath/$fileName";
  static String animation(String fileName) => "$_animationPath/$fileName";
  static String fonts(String fileName) => "$_fontsPath/$fileName";
  static String svg(String fileName) => "$_svgPath/$fileName";
}
