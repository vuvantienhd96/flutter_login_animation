import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animasi_login/loginAnimation.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Animation Tutorial',
      home: new LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage>  with TickerProviderStateMixin{
  var statusClick=0;

  TextEditingController editingControllerUser;
  TextEditingController editingControllerPass;


  AnimationController animationControllerButton;

  @override
  void initState() {

    editingControllerUser= new TextEditingController(text: '');
    editingControllerPass= new TextEditingController(text: '');
    super.initState();
    animationControllerButton= AnimationController(duration: Duration(seconds: 3), vsync: this)
    ..addStatusListener((status){
      if(status == AnimationStatus.dismissed){
        setState(() {
         statusClick = 0 ; 
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationControllerButton.dispose();
  }

  Future<Null> _playAnimation() async{
    try{
      await animationControllerButton.forward();
      await animationControllerButton.reverse();
    } on TickerCanceled{}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/2.jpg'), fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                Color.fromRGBO(162, 146, 199, 0.8),
                Color.fromRGBO(51, 51, 63, 0.9),
              ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter)),
          child: ListView(
            padding: const EdgeInsets.all(0.0),
            children: <Widget>[
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 270.0),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(10.0),
                            ),
                            TextField(
                              style: new TextStyle(color: Colors.white),
                              controller: editingControllerUser,
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.person_outline,
                                    color: Colors.white,
                                  ),
                                  hintText: 'Username'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                            ),
                            TextField(
                              style: new TextStyle(color: Colors.white),
                              controller: editingControllerPass,
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.lock_outline,
                                    color: Colors.white,
                                  ),
                                  hintText: 'Password',
                                  ),
                            ),
                            FlatButton(
                              padding:
                                  EdgeInsets.only(top: 220.0, bottom: 30.0),
                              onPressed: null,
                              child: Text(
                                "Don't have an account? Sign Up here",
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                    letterSpacing: 0.5),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  statusClick==0 ?
                  new InkWell(
                    onTap: (){
                      setState(() {
                       statusClick = 1; 
                      });
                      _playAnimation();
                    },child: new SignIn(),
                  ) : new StartAnimation(
                    buttonController: animationControllerButton.view,
                    user: editingControllerUser.text,
                    pass: editingControllerPass.text,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.all(60),
      child: Container(
        alignment: FractionalOffset.center,
        width: 320.0,
        height: 60.0,
        decoration: BoxDecoration(
            color: Colors.red[700],
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
        child: Text(
          'Sign In',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w300,
              letterSpacing: 0.3),
        ),
      ),
    );
  }
}
