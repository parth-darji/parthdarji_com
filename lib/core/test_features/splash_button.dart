import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  final Widget child;
  final Function()? onPressed;

  const Splash({
    super.key,
    this.onPressed,
    required this.child,
  });

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {
  double _opacity = 0.8;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _opacity = 1; // Decrease opacity on tap down
        });
      },
      onTapUp: (_) {
        setState(() {
          _opacity = 0.8; // Restore opacity on tap up
        });
      },
      onTapCancel: () {
        setState(() {
          _opacity = 0.8; // Restore opacity if tap is canceled
        });
      },
      child: Opacity(
        opacity: _opacity,
        child: widget.child,
      ),
    );
  }
}
