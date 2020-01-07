import 'package:flutter/material.dart';
import 'package:i_sip/elements/Players.dart';

class PlayerList {
  final List<Players> players;

  PlayerList({this.players});

  List<Widget> getPlayers() {
    List<Widget> playerList = [];
    for (var i = 0; i<this.players.length;i+=1) {
      playerList.add(
        Container(
          child: Row(
            children: <Widget>[
              Icon(
                Icons.person,
                color: players[i].color,
                size: 60,
              ),
              Text(
                "   " + players[i].score.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 30),
              )
            ],
          ),
        )
      );
    }
    return playerList;
  }
}