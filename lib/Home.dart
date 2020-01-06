import 'package:i_sip/main.dart';
import 'package:flutter/material.dart';
import 'package:i_sip/Login.dart';
import 'package:i_sip/SignUp.dart';
import 'package:i_sip/elements/PersButton.dart';
import 'dart:math';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    )..addListener(() => setState(() {}));
    animation =
        Tween<double>(begin: -0.02, end: 0.02).animate(animationController);
    animationController.repeat(
        period: Duration(milliseconds: 1500), reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Container(
          height: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.only(top: 30),
          child: Center(
            child: Column(
              children: <Widget>[
                RotationTransition(
                  child: Image(
                    image: AssetImage("assets/sip.png"),
                    height: 170,
                  ),
                  turns: animation,
                ),
                Container(
                    padding: EdgeInsets.only(top: 20),
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          width: 250,
                          height: 70,
                          child: FlatButton(
                            color: Colors.grey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Se connecter ?",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  "Desactivé pour le moment*",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                ),
                              ],
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(5.0)),
                            onPressed: () {
//                            Navigator.pushReplacement( //A REACTIVER
//                              context,
//                              MaterialPageRoute(
//                                  builder: (context) => Login()),
//                            );
                            },
                          ),
                        ),
                        PersButton(
                          height: 40,
                          text: "jouer sans se connecter",
                          color: Colors.green,
                          defaultStyle: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          routeName: '/menu',
                        ),
                      ],
                    )),
                Text("Partagez vos iSip sur #iSipInstagram !",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//class _HomeStates extends State<Home> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Form(
//        child: Container(
//          height: double.infinity,
//          color: Color.fromARGB(255, 255, 255, 255),
//          padding: EdgeInsets.all(40),
//          child: Center(
//            child: Column(
//              children: <Widget>[
//                Image(
//                  image: AssetImage("assets/sip.png"),
//                  width: 220,
//                ),
//                Container(
//                  height: 200,
//                  decoration: new BoxDecoration(
//                      color: Color.fromARGB(255, 134, 89, 48),
//                      borderRadius: BorderRadius.circular(15),
//                      border: Border.all(
//                          color: Color.fromARGB(255, 58, 30, 22), width: 5.0)),
//                  padding: EdgeInsets.all(20),
//                  child: Center(
//                    child: Column(
//                      children: <Widget>[
//                        SizedBox(
//                          width: 400,
//                          height: 50,
//                          child: FlatButton(
//                            color: Color.fromARGB(255, 244, 194, 87),
//                            child: Text("Se connecter"),
//                            shape: RoundedRectangleBorder(
//                                borderRadius: new BorderRadius.circular(10.0)),
//                            onPressed: () {
//                              Navigator.pushReplacement(
//                                context,
//                                MaterialPageRoute(
//                                    builder: (context) => Login()),
//                              );
//                            },
//                          ),
//                        ),
//                        Container(
//                          height: 40,
//                        ),
//                        SizedBox(
//                          height: 50,
//                          width: 400,
//                          child: FlatButton(
//                            color: Color.fromARGB(255, 244, 194, 87),
//                            child: Text("S'inscrire"),
//                            shape: RoundedRectangleBorder(
//                                borderRadius: new BorderRadius.circular(10.0)),
//                            onPressed: () {
//                              Navigator.pushReplacement(
//                                context,
//                                MaterialPageRoute(
//                                    builder: (context) => SignUp()),
//                              );
//                            },
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                ),
//                Container(height: 10),
//                GestureDetector(
//                  child: Text(
//                    "Continuez sans se connecter",
//                    style: TextStyle(
//                        decoration: TextDecoration.underline,
//                        color: Color.fromARGB(255, 58, 30, 22)),
//                  ),
//                  onTap: () {
//                    //TODO
//                  },
//                )
//              ],
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}

//class ShakeCurve extends Curve {
//  @override
//  double transform(double t) => sin(t * 4);
//}
