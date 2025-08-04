import 'package:cloud_firestore/cloud_firestore.dart';

class Review {
  String id;
  String title;
  String content;
  String mapX;
  String mapY;
  DateTime date;
  String password;
  Review(
      {required this.id,
      required this.title,
      required this.content,
      required this.date,
      required this.mapX,
      required this.mapY,
      required this.password});

  Review.fromJson(Map<String, dynamic> map, String id)
      : this(
            id: id,
            title: map['title'],
            content: map['content'],
            date: (map['date'] as Timestamp).toDate(),
            mapX: map['mapX'],
            mapY: map['mapY'],
            password: map['password']);

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'date': date,
      'mapX': mapX,
      'mapY': mapY,
      'password': password,
    };
  }
}
