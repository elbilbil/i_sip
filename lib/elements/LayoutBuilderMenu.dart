import 'package:flutter/material.dart';
import 'CardBox.dart';
import 'dart:math';

class LayoutBuilderMenu extends StatelessWidget{
  final List<CardBox> cardBox;
  List<LayoutBuilder> layoutBuilder = [];
  LayoutBuilderMenu({this.cardBox});

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < cardBox.length; i+=2) {
        layoutBuilder.add(LayoutBuilder(
          builder: (context, constraints){
            return Container(
              padding: EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  cardBox[i],
                  cardBox[i+1]
                ],
              ),
            );
          },
        ));
    }
    return Column(
      children: layoutBuilder.map((elem) => new Container(child: elem)).toList(),
    );
  }

}