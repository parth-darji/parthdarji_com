import 'package:flutter/material.dart';

class WidgetTravelling<T> {
  final Widget widget;
  final Route<T>? customPageRoute;

  WidgetTravelling({
    required this.widget,
    this.customPageRoute,
  });
}
