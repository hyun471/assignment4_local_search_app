import 'package:cloud_firestore/cloud_firestore.dart';

class Review {
  String title;
  String content;
  String mapX;
  String mapY;
  DateTime date;
  Review({
    required this.title,
    required this.content,
    required this.date,
    required this.mapX,
    required this.mapY,
  });

  Review.fromJson(Map<String, dynamic> map)
      : this(
          title: map['title'],
          content: map['content'],
          date: (map['date'] as Timestamp).toDate(),
          mapX: map['mapX'],
          mapY: map['mapY'],
        );

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'date': date,
      'mapX': mapX,
      'mapY': mapY,
    };
  }
}
