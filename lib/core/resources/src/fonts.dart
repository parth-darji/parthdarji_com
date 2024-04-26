part of resources;

abstract class FontsAsset {
  late String sfProRegular;
}

class Fonts implements FontsAsset {
  @override
  String sfProRegular = AssetPath.image("SF-Pro-Display-Regular.otf");
}
