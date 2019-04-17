import 'package:flutter/material.dart';
import 'dart:math';

class PageReveal extends StatelessWidget {
  final double revealPercent;
  final Widget child;

  PageReveal({this.revealPercent, this.child});

  @override
  Widget build(BuildContext context) {
    return new ClipOval(
      clipper: new CircleReveallipper(revealPercent, ),
      child: child,
    );
  }
}

class CircleReveallipper extends CustomClipper<Rect> {
  final double revealPercent;
  CircleReveallipper(
    this.revealPercent,
  );

  @override
  Rect getClip(Size size) {
    final epicenter = new Offset(size.width / 2, size.height * 0.9);
    // caculator distance from epicenter to the top left coner to make sure we fill the screen
    double theta = atan(epicenter.dy / epicenter.dx);
    final distanceToConer = epicenter.dy / sin(theta);

    final radius = distanceToConer * revealPercent;
    final diameter = 2 * radius;

    return new Rect.fromLTWH(
        epicenter.dx - radius, epicenter.dy - radius, diameter, diameter);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
