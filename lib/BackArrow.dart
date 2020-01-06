import 'package:flutter/material.dart';
import 'package:i_sip/Home.dart';

class BackArrow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          iconSize: 30,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context, CustomBackRoute(builder: (context) => Home()),
            );
          },
        ),
      ],
    );
  }}


class CustomBackRoute<T> extends MaterialPageRoute<T> {
  CustomBackRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    return new SlideTransition(
        position: Tween<Offset>(
            begin: const Offset(-1.0, 0.0), end: const Offset(0.0, 0.0))
            .animate(animation),
        child: child);
  }
}