import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  @override
  _Player createState() => _Player();
}

class _Player extends State<Player> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.blueAccent, //change your color here
        ),
        title: Text(
          "Maintenant, qui joue ?",
          style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 40),
            icon: Icon(
              Icons.play_circle_filled,
              color: Colors.green,
              size: 50,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/game');
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    padding: EdgeInsets.all(40),
                    width: constraints.maxWidth,
                    child: Column(
                      children: <Widget>[
                        Text(
                          "ECRAN SELECTION DE JOUEUR A VENIR*",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.red
                          ),
                        ),
                        Container(height: 20,),
                        Text("4 JOUEURS DE DISPO : \n\n"
                            "- MICHEL L'ALCOLO\n"
                            "- JULIEN LE FOU\n"
                            "- ROBERT LA MENACE\n"
                            "- REGIS BAH REGIS",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20
                        ),)
                      ],
                    )
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

}