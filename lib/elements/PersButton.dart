import 'package:flutter/material.dart';

class PersButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final text;
  final TextStyle defaultStyle;
  final routeName;

  static const TextStyle defStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20);

  PersButton(
      {Key key,
      this.width = 250,
      this.height = 70,
      this.color = Colors.grey,
      this.text = "default text",
      this.defaultStyle = defStyle,
      this.routeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: this.width,
      height: this.height,
      child: FlatButton(
        color: this.color,
        child: Text(
          text,
          style: this.defaultStyle,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0)),
        onPressed: () {
          Navigator.pushNamed(context, this.routeName);
        },
      ),
    );
  }
}
