import 'package:flutter/material.dart';

class StartAnimation extends StatefulWidget {
  StartAnimation({Key key, this.buttonController, this.user, this.pass}): shrinkButonAnimation = new Tween(
    begin: 320.0,
    end: 70.0
  ).animate(CurvedAnimation(
    parent: buttonController,
    curve: Interval(0.0, 0.150)
  ),
  
  ),
  zoomAnimation= new Tween(
    begin: 70.0,
    end: 900.0
  ).animate(CurvedAnimation(
    parent: buttonController,
    curve: Interval(0.550, 0.999, curve: Curves.bounceInOut)
  )),
  super(key:key);

  final AnimationController buttonController;
  final Animation shrinkButonAnimation;
  final Animation zoomAnimation;
  final String user;
  final String pass;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Padding(
      padding: EdgeInsets.only(bottom: 60.0),
      child:
      
       zoomAnimation.value <=300 ?
       Container(
        alignment: FractionalOffset.center,
        width: shrinkButonAnimation.value,
        height: 60.0,
        decoration: BoxDecoration(
            color: Colors.blue[700],
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
        child: shrinkButonAnimation.value > 75
        ? Text(
          'Sign In',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w300,
              letterSpacing: 0.3),
        )
        // change circularProgressIndicator 
        : CircularProgressIndicator(strokeWidth: 1.0,valueColor: AlwaysStoppedAnimation<Color>(Colors.white),),
      )
      : Container(
        
        width: zoomAnimation.value,
        height: zoomAnimation.value,
        decoration: BoxDecoration(
          color: Colors.blue,
          shape: zoomAnimation.value < 600
          ? BoxShape.circle
          : BoxShape.rectangle
        ),
      ),
    );
  }

  @override
  _StartAnimationState createState() => new _StartAnimationState();
}

class _StartAnimationState extends State<StartAnimation> {
  @override
  Widget build(BuildContext context) {
    return new AnimatedBuilder(
      builder: widget._buildAnimation,
      animation: widget.buttonController,
    );
  }
}
