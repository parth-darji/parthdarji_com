import 'dart:developer';

import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class SwipeUpAnimationDemo extends StatefulWidget {
  const SwipeUpAnimationDemo({super.key});

  @override
  SwipeUpAnimationDemoState createState() => SwipeUpAnimationDemoState();
}

class SwipeUpAnimationDemoState extends State
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isOpened = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleAnimation() {
    log("toggle animation called");
    setState(() {
      _isOpened = !_isOpened;
    });
    if (_isOpened) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonText('Swipe Up Animation Demo'),
      ),
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.delta.dy > 0) {
            // Swipe down
          } else {
            // Swipe up
            _toggleAnimation();
          }
        },
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              height: MediaQuery.of(context).size.height * _animation.value,
              color: Colors.blue,
              child: const Center(
                child: CommonText(
                  'Swipe Up to Open',
                  style: TextStyle(color: Colors.black, fontSize: 24.0),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
