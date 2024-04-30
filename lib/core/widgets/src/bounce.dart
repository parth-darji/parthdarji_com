part of widgets;

class Bounce extends StatefulWidget {
  final Widget child;
  final Function()? onPressed;

  const Bounce({super.key, required this.child, this.onPressed});

  @override
  BounceState createState() => BounceState();
}

class BounceState extends State<Bounce> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    double min = 0.95;
    double max = 1;

    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
        if (widget.onPressed != null) {
          widget.onPressed!();
        }
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: widget.child.animate(effects: [
        ScaleEffect(
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInOut,
          begin: _isPressed ? Offset(max, max) : Offset(min, min),
          end: _isPressed ? Offset(min, min) : Offset(max, max),
        ),
      ]),
    );
  }
}
