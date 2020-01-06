import 'package:flutter/material.dart';

class CardsTypes {
  final String title;
  final img;
  final int quantite;
  final details;
  final bool free;

  CardsTypes({this.title,
    this.img,
    this.quantite = 0,
    this.details,
    this.free
  });

  factory CardsTypes.fromJson(Map<String, dynamic> json) {
    return  new CardsTypes(
      title: json['title'] as String,
      img: json['img'] as String,
      quantite: json['quantite'] as int,
      details: json['details'] as String,
      free: json['free'] as bool
    );
  }
}