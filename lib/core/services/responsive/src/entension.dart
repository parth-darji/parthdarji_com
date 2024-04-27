part of responsive;

extension ScreenSize on double {
  double get h => ScreenManager.instance.setHeight(this);

  double get w => ScreenManager.instance.setWidth(this);

  double get sp => ScreenManager.instance.setSp(this);
}
