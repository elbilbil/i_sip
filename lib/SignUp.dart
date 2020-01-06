import 'package:flutter/material.dart';
import 'package:i_sip/Home.dart';
import 'package:i_sip/BackArrow.dart';
import 'package:i_sip/Login.dart';
import 'package:i_sip/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_functions/cloud_functions.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUp createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  TextEditingController email;
  TextEditingController password;
  TextEditingController name;

  final formKey = GlobalKey<FormState>();

  bool loading = false;

  @override
  void initState() {
    super.initState();
    name = TextEditingController(text: "");
    email = TextEditingController(text: "");
    password = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: name,
                          validator: (value) =>
                          (value.isEmpty) ? "Please Enter Name" : null,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            labelText: "Name",
                          ),
                        ),
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
                        SizedBox(
                          height: 50,
                          width: 400,
                          child: FlatButton(
                            color: Color.fromARGB(255, 244, 194, 87),
                            child: Text("S'inscrire"),
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0)),
                            onPressed: !loading ? () async {
                              if (!formKey.currentState.validate()) {
                                return;
                              }
                              setState(() {
                                loading = true;
                              });
                              final HttpsCallable callable =
                              CloudFunctions.instance.getHttpsCallable(
                                functionName: 'registerUser',
                              );
                              try {
                                await callable.call(<String, dynamic>{
                                  'email': email.text,
                                  'displayName': name.text,
                                  'password': password.text
                                });

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
                            } : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(height: 10),
                GestureDetector(
                  child: Text(
                    "deja un compte ? se connecter",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color.fromARGB(255, 58, 30, 22)),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Login()),
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
