import 'package:flutter/material.dart';
import 'package:i_sip/Home.dart';
import 'package:i_sip/BackArrow.dart';
import 'package:i_sip/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:i_sip/main.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  TextEditingController email;
  TextEditingController password;

  final formKey = GlobalKey<FormState>();
  bool loading = false;

  @override
  void initState() {
    super.initState();
    email = TextEditingController(text: "");
    password = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Container(
          height: double.infinity,
          color: Color.fromARGB(255, 244, 194, 87),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                BackArrow(),
                Image(
                  image: AssetImage("assets/sipHeader.png"),
                  width: 340,
                ),
                Container(
                  height: 300,
                  margin: const EdgeInsets.only(top: 50.0),
                  decoration: new BoxDecoration(
                      color: Color.fromARGB(255, 134, 89, 48),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: Color.fromARGB(255, 58, 30, 22), width: 5.0)),
                  padding: EdgeInsets.only(bottom: 15, left: 15, right: 15),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Container(height: 15),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: email,
                          validator: (value) =>
                              (value.isEmpty) ? "Please Enter Email" : null,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            labelText: "Email",
                          ),
                        ),
                        Container(height: 15),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          controller: password,
                          validator: (value) =>
                              (value.isEmpty) ? "Please Enter Password" : null,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.security),
                            labelText: "Password",
                          ),
                        ),
                        Container(height: 35),
                        SizedBox(
                          height: 50,
                          width: 400,
                          child: FlatButton(
                            color: Color.fromARGB(255, 244, 194, 87),
                            child: Text("Se connecter"),
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0)),
                            onPressed: !loading
                                ? () async {
                              if (!formKey.currentState.validate()) {
                                return;
                              }
                              setState(() {
                                loading = true;
                              });

                              try {
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                    email: email.text,
                                    password: password.text);
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AuthCheck()),
                                );
                              } catch (e) {
                                setState(() {
                                  loading = false;
                                });
                                print(e);
                              }
                            }
                                : null,
                          ),
                        ),
                        Container(height: 5),
                        GestureDetector(
                          child: Text(
                            "Mot de passe oublié ?",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Color.fromARGB(255, 58, 30, 22)),
                          ),
                          onTap: () {
                            //todo
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Container(height: 10),
                GestureDetector(
                  child: Text(
                    "Pas encore de compte ? s'inscrire",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color.fromARGB(255, 58, 30, 22)),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );
                  },
                ),
                Container(height: 10),
                GestureDetector(
                  child: Text(
                    "Continuez sans se connecter",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color.fromARGB(255, 58, 30, 22)),
                  ),
                  onTap: () {
                    //TODO
                  },
                ),
                Container(height: 100)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
