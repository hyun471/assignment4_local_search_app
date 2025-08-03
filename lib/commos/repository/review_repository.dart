import 'package:assignment4_local_search_app/commos/models/review.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewRepository {
  Future<List<Review>?> getAll() async {
    try {
      final firestore = FirebaseFirestore.instance;
      final collectionRef = firestore.collection('reviews');
      final result = await collectionRef.get();
      final docs = result.docs;
      return docs.map(
        (doc) {
          return Review.fromJson(doc.data());
        },
      ).toList();
    } catch (e) {
      print(e);
      return null;
    }
  }

  // 리뷰 작성
  Future<bool> insert({
    required String title,
    required String content,
    required String mapX,
    required String mapY,
  }) async {
    try {
      final firestore = FirebaseFirestore.instance;
      final collectionRef = firestore.collection('reviews');
      final docRef = collectionRef.doc();

      await docRef.set({
        'title': title,
        'content': content,
        'mapX': mapX,
        'mapY': mapY,
        'date': DateTime.now().toIso8601String(),
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // 좌표를 활용하여 해당 좌표의 모든 리뷰 불러오기
  Future<List<Review>> reviewStream({
    required String mapX,
    required String mapY,
  }) async {
    final firestore = FirebaseFirestore.instance;
    final collectionRef = firestore.collection('reviews');
    final result = await collectionRef
        .where(
          'mapX',
          isEqualTo: mapX,
        )
        .where(
          'mapY',
          isEqualTo: mapY,
        )
        .orderBy('date', descending: true)
        .get();
    final streamReviews = result.docs.map(
      (doc) {
        return Review.fromJson({
          ...doc.data(),
        });
      },
    ).toList();
    return streamReviews;
  }
}
