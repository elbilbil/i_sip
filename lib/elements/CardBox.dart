import 'package:flutter/material.dart';

class CardBox extends StatelessWidget {
  final Color cardColor;
  final double maxWidth;
  final double maxHeight;
  final image;
  final cardTitle;
  final int nbCards;
  final BuildContext context;
  final details;
  final InkWell checkbox;
  final bool free;

  final bool selectedDeck;

  CardBox(
      {Key key,
      this.cardColor = Colors.grey,
      this.maxWidth,
      this.maxHeight,
      this.image,
      this.cardTitle,
      this.nbCards = 0,
      this.selectedDeck,
      this.context,
      this.details,
      this.checkbox,
      this.free = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: this.cardColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      width: this.maxWidth / 2 - 5,
      height: 150,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 0.1,
                          offset: Offset(-0.5, 2))
                    ],
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill, image: AssetImage(this.image))),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      this.cardTitle,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Container(
                      height: 3,
                    ),
                    Text(
                      this.nbCards.toString() + " cartes",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              this.checkbox,
              this.free ? Text(
                "Utiliser ce deck",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 17,
                  color: selectedDeck ? Colors.black : Colors.grey,
                ),
              ) :
              Text(
                "Ceci n'est pas gratuit",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 17,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              GestureDetector(
                child: Text(
                  "DETAILLES",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                onTap: () {
                  _showBottom();
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  void _showBottom() {
    showModalBottomSheet<void>(
        context: this.context,
        isScrollControlled: true,
        /*bottom sheet is like a drawer that pops off where you can put any
      controls you want, it is used typically for user notifications*/
        //builder lets your code generate the code
        builder: (BuildContext context) {
          return new Container(
              height: this.maxHeight,
              padding: EdgeInsets.all(20),
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 0.1,
                              offset:
                                  Offset(-0.5, 2), // changes position of shadow
                            ),
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(this.image),
                          )),
                    ),
                    Container(
                      width: 610,
                      padding: EdgeInsets.only(left: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(this.cardTitle + "\n",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold)),
                          Text(
                            this.details,
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => Navigator.pop(context),
                      child: new Text('Fermer'),
                    )
                  ],
                ),
              ));
        });
  }
}
