import 'package:flutter/material.dart';

class StartAnimation extends StatefulWidget {
  StartAnimation({Key key, this.buttonController});

  final AnimationController buttonController;
  @override
  _StartAnimationState createState() => new _StartAnimationState();
  
}

class _StartAnimationState extends State<StartAnimation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(60),
      child: Container(
        alignment: FractionalOffset.center,
        width: 320.0,
        height: 60.0,
        decoration: BoxDecoration(
            color: Colors.blue[700],
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
        child: Text(
          'Sign In',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w300,
              letterSpacing: 0.5),
        ),
      ),
    );
  }

}