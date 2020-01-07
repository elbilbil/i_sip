import 'package:flutter/material.dart';

class ChallengesCards {
  final List<Challenges> challenges;
  final double width;
  final Color color;
  final Switch switch1;
  final Switch switch2;

  ChallengesCards({this.challenges, this.width, this.color, this.switch1, this.switch2});

  List<Widget> getCards(){
    List<Widget> cards = [];

    for(var i =0;i<this.challenges.length;i+=1) {
      cards.add(Container(
          padding: EdgeInsets.all(20),
          width: this.width-200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
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
                    color: this.color,
                    size: 70
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30, bottom: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          this.challenges[i].title,
                          style: TextStyle(
                              color: this.color,
                              fontStyle: FontStyle.italic,
                              fontSize: 25),
                        ),
                        Container(
                          height: 5,
                        ),
                        Text(
                          this.challenges[i].disc,
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
                    child: this.switch1,
                  ),
                  Text(
                    "   +" +this.challenges[i].p1.toString()+" pts",
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  )
                ],
              ),
              Container(
                width: this.width,
                height: 3,
                color: Color.fromARGB(255, 230, 230, 230),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    width: this.width-400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.unmodifiable(() sync*{
                        yield Text(
                          "BOIT",
                          style: TextStyle(
                              color: this.color,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        );
                        yield* getDrinks(this.challenges[i].sips);
                      }())
                    ),
                  ),
                  Transform.scale(
                    scale: 1.5,
                    child: this.switch2,
                  ),
                  Text(
                    "   +" +this.challenges[i].p2.toString()+" pts",
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  )
                ],
              )
            ],
          ),
        ),
      );
    }
    return cards;
  }

  List<Widget> getDrinks(int nbDrinks){
    List<Widget> drinks = [];

    for(var i =0;i<nbDrinks;i+=1){
      drinks.add(
        Image(
          image: AssetImage("assets/shot.png"),
          width: 50,
          height: 60,
          color: this.color,
        ),
      );
    }

    return drinks;
  }
}

class Challenges {
  final title;
  final disc;
  final int p1;
  final int p2;
  final int sips;

  Challenges({this.title, this.disc, this.p1, this.p2, this.sips});
}

class StackOfCards extends StatelessWidget {
  final int num;
  final Widget child;
  final double offset;

  const StackOfCards({Key key, int num = 1, @required this.child, this.offset = 5.0})
      : this.num = num > 0 ? num : 1,
        assert(offset != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
    children: List<Widget>.generate(
        num - 1,
            (val) => Positioned(
            bottom: val * offset,
            left: val * offset,
            top: (num - val - 1) * offset,
            right: (num - val - 1) * offset,
            child: Card(child: Container()))).toList()
      ..add(
        Padding(
          child: Card(child: child),
          padding: EdgeInsets.only(bottom: (num - 1) * offset, left: (num - 1) * offset),
        ),
      ),
  );
}