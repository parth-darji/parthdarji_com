part of resources;

abstract class ImagesAsset {
  late String appLogo;
}

class Images implements ImagesAsset {
  @override
  String appLogo = AssetPath.image("app_logo.png");
}
