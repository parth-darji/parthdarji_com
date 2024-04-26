part of resources;

abstract class SvgAsset {
  late String mic;
}

class Svg implements SvgAsset {
  @override
  String mic = AssetPath.image("mic.svg");
}
