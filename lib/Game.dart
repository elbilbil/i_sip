import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:i_sip/elements/Players.dart';
import 'package:i_sip/elements/PlayerList.dart';
import 'package:i_sip/elements/Challenges.dart';

class Game extends StatefulWidget {
  @override
  _Game createState() => _Game();
}

class _Game extends State<Game> {
  final winnerScore = 50;
  final List<Players> players = List<Players>(4);
  List<Challenges> challenges = [];
  int turn = 0;
  int card = 0;
  bool switch1 = false;
  bool switch2 = false;

  @override
  void initState() {
    // temporaire
    players[0] = (Players(name: "Michel", color: Colors.brown));
    players[1] = (Players(name: "Julien", color: Colors.blue));
    players[2] = (Players(name: "Robert", color: Colors.greenAccent));
    players[3] = (Players(name: "Regis", color: Colors.pinkAccent));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PlayerList playerlist = PlayerList(players: players);

    return Scaffold(
        body: Container(
          color: Color.fromARGB(255, 230, 230, 230),
          child: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 50, bottom: 20, top: 20, right: 20),
                      width: constraints.maxWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 70,
                            child: Row(
                              children: <Widget>[
                                Image(
                                  image: AssetImage("assets/trophy.png"),
                                  width: 30,
                                  height: 30,
                                ),
                                Text(" " + winnerScore.toString(),
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 50),
                            child: Text(
                              "Mr. " + players[turn].name + ", a toi de jouer !",
                              style: TextStyle(
                                  color: players[turn].color,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26),
                            ),
                          ),
                          IconButton(
                              padding: EdgeInsets.only(bottom: 20),
                              icon: Icon(
                                Icons.play_circle_filled,
                                color: players[turn].color,
                                size: 35,
                              ),
                              onPressed: () {
                                  if (switch1 || switch2) {
                                    setState(() {
                                      ++turn > 3 ? turn = 0 : turn;
                                      players[turn].score +=2;
                                      ++card > 6 ? card = 0 : card;
                                      switch1 = false;
                                      switch2=false;
                                    });
                                  } else {
                                    _myPoppup();
                                  }
                                },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: constraints.maxWidth,
                      padding: EdgeInsets.only(top: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.unmodifiable(() sync* {
                                yield* playerlist.getPlayers();
                              }())
                            )),
                          FutureBuilder(
                            future: DefaultAssetBundle.of(context)
                                .loadString('assets/challenges.json'),
                            builder: (BuildContext context, AsyncSnapshot snapshot) {
                              final response = json.decode(snapshot.data.toString());
                              if (response.toString().isNotEmpty){
                                for (var i=1;i<response["length"]+1;i+=1) {
                                  final res = response[i.toString()];
                                  this.challenges.add(Challenges(title: res["title"], disc: res["disc"], p1: res["p1"], p2: res['p2'], sips: res["sips"]));
                                }
                              }
                              return ChallengesCards(
                                  challenges: this.challenges,
                                  width: constraints.maxWidth,
                                  color: players[turn].color,
                                  switch1: Switch(
                                    value: switch1,
                                    onChanged: (value) {
                                      setState(() {
                                        switch1 = value;
                                      });
                                    },
                                    activeColor: players[turn].color,
                                  ),
                                  switch2: Switch(
                                    value: switch2,
                                    onChanged: (value) {
                                      setState(() {
                                        switch2 = value;
                                      });
                                    },
                                    activeColor: players[turn].color,
                                  )).getCards()[this.card];
                          },),
                        ],
                      ),
                    ),
                  ],
                );
              },
            )
          ),
        ));
  }

  Future<void> _myPoppup() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Oops! Boit ou fait le challenge !",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  "Hey! Tu dois au moins faire un des deux!\nComment tu vas t'amuser sinon ?",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                "Okay",
                style: TextStyle(
                    color: Colors.blueAccent, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

