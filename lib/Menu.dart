import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:i_sip/elements/CardBox.dart';
import 'package:i_sip/elements/LayoutBuilderMenu.dart';
import 'package:i_sip/elements/CardsTypes.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<bool> selectedDeck = new List<bool>.filled(6, false);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<CardBox> cardBox = [];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.blueAccent, //change your color here
        ),
        title: Text(
          "Premierement, choisisez un ou plusieurs packets...",
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
              selectedDeck.contains(true)
                  ? Navigator.pushNamed(context, '/player')
                  : _myPoppup();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/cardsTypes.json'),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  final response = json.decode(snapshot.data.toString());
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      if (response.toString().isNotEmpty) {
                        for (var i = 1; i < response['length'] + 1; i += 1) {
                          final res = response[i.toString()];
                          cardBox.add(CardBox(
                            cardColor: Color.fromARGB(res["alpha"], res["red"],
                                res["green"], res["blue"]),
                            maxWidth: constraints.maxWidth,
                            maxHeight: constraints.maxHeight,
                            image: res["img"],
                            cardTitle: res["title"],
                            nbCards: res["quantite"],
                            context: context,
                            details: res["details"],
                            selectedDeck: selectedDeck[i - 1],
                            free: res["free"],
                            checkbox: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedDeck[i - 1] = !selectedDeck[i - 1];
                                });
                              },
                              child: Container(
                                child: res["free"]
                                    ? Padding(
                                        padding: EdgeInsets.all(10),
                                        child: selectedDeck[i - 1]
                                            ? Icon(
                                                Icons.check,
                                                color: Colors.black,
                                              )
                                            : Icon(
                                                Icons.add_circle,
                                                color: Colors.grey,
                                              ),
                                      )
                                    : Padding(
                                        padding: EdgeInsets.all(10),
                                        child: selectedDeck[i - 1]
                                            ? Icon(
                                                Icons.lock,
                                                color: Colors.black,
                                              )
                                            : Icon(
                                                Icons.lock,
                                                color: Colors.black,
                                              ),
                                      ),
                              ),
                            ),
                          ));
                        }
                      }
                      return LayoutBuilderMenu(cardBox: cardBox);
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _myPoppup() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Oops!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  "Hey! Tu dois selectionner au moin un paquet de carte.\nComment tu vas jouer sinon ?",
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
