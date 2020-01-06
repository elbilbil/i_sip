import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  @override
  _Game createState() => _Game();
}

class _Game extends State<Game> {
  final winnerScore = 10;
  final List<Players> players = [];
  int turn = 0;

  @override
  Widget build(BuildContext context) {
    bool switch1 = false;
    bool switch2 = false;

    // temporaire
    players.add(Players(name: "Michel", color: Colors.brown));
    players.add(Players(name: "Julien", color: Colors.blue));
    players.add(Players(name: "Robert", color: Colors.greenAccent));
    players.add(Players(name: "Regis", color: Colors.pinkAccent));

    return Scaffold(
        body: Container(
      color: Color.fromARGB(255, 230, 230, 230),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding:
                  EdgeInsets.only(left: 50, bottom: 20, top: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        Text(
                          " " + winnerScore.toString(),
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 26),
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
                  Container(
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          IconButton(
                            padding: EdgeInsets.only(bottom: 20),
                            icon: Icon(
                              Icons.play_circle_filled,
                              color: players[turn].color,
                              size: 35,
                            ),
                            onPressed: () {
                              setState(() {
                                ++turn > 3 ? turn=0: turn;
                              });
                            },
                          ),
                        ],
                      ))
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.person,
                              color: players[0].color,
                              size: 60,
                            ),
                            Text(
                              "   " + players[0].score.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.person,
                              color: players[1].color,
                              size: 60,
                            ),
                            Text(
                              "   " + players[1].score.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.person,
                              color: players[2].color,
                              size: 60,
                            ),
                            Text(
                              "   " + players[2].score.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.person,
                              color: players[3].color,
                              size: 60,
                            ),
                            Text(
                              "   " + players[3].score.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  width: 600,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.error_outline,
                            color: players[turn].color,
                            size: 70,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 30, bottom: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Fait nous 6 roulades",
                                  style: TextStyle(
                                      color: players[turn].color,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 25),
                                ),
                                Container(
                                  height: 5,
                                ),
                                Text(
                                  "Des roulades bien droites hein !",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 15),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Transform.scale(
                            scale: 1.5,
                            child: Switch(
                              value: switch1,
                              onChanged: (value) {
                                setState(() {
                                  switch1 = !switch1;
                                });
                              },
                              activeColor: players[turn].color,
                            ),
                          ),
                          Text(
                            "   +2 pts",
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          )
                        ],
                      ),
                      Container(
                        width: 600,
                        height: 3,
                        color: Color.fromARGB(255, 230, 230, 230),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            width: 400,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "BOIT",
                                  style: TextStyle(
                                      color: players[turn].color,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                Image(
                                  image: AssetImage("assets/shot.png"),
                                  width: 50,
                                  height: 60,
                                  color: players[turn].color,
                                ),
                                Image(
                                  image: AssetImage("assets/shot.png"),
                                  width: 50,
                                  height: 60,
                                  color: players[turn].color,
                                ),
                                Image(
                                  image: AssetImage("assets/shot.png"),
                                  width: 50,
                                  height: 60,
                                  color: players[turn].color,
                                ),
                              ],
                            ),
                          ),
                          Transform.scale(
                            scale: 1.5,
                            child: Switch(
                              value: switch1,
                              onChanged: (value) {
                                setState(() {
                                  switch1 = !switch1;
                                });
                              },
                              activeColor: players[turn].color,
                            ),
                          ),
                          Text(
                            "   +2 pts",
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

class Players {
  final name;
  final score;
  final Color color;

  Players({this.name, this.score = 0, this.color});
}
