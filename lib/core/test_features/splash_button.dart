import 'package:flutter/cupertino.dart';

class Splash extends StatefulWidget {
  final Widget child;
  final Function()? onPressed;
  final bool firstIndex;
  final bool lastIndex;

  const Splash({
    super.key,
    this.onPressed,
    required this.child,
    required this.firstIndex,
    required this.lastIndex,
  });

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {
  bool isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isButtonPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isButtonPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          isButtonPressed = false;
        });
      },
      onTap: widget.onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: isButtonPressed
              ? CupertinoColors.systemGrey5
              : CupertinoColors.systemGrey6,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(widget.firstIndex ? 15 : 0),
            topRight: Radius.circular(widget.firstIndex ? 15 : 0),
            bottomLeft: Radius.circular(widget.lastIndex ? 15 : 0),
            bottomRight: Radius.circular(widget.lastIndex ? 15 : 0),
          ),
        ),
        child: widget.child,
      ),
    );
  }
}
