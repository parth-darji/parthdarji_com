part of resources;

abstract class AnimationsAsset {
  late String walkingWorking;
}

class Animations implements AnimationsAsset {
  @override
  String walkingWorking = AssetPath.image("walking_working.riv");
}
