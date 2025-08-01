import 'package:assignment4_local_search_app/commos/models/local.dart';
import 'package:assignment4_local_search_app/commos/models/review.dart';
import 'package:assignment4_local_search_app/commos/repository/review_repository.dart';
import 'package:riverpod/riverpod.dart';

// 뷰모델
class ReviewViewModel
    extends AutoDisposeFamilyNotifier<List<Review>, Local> {
  @override
  List<Review> build(local) {
    getAllReviews(local: local);
    return [];
  }

  // 리뷰 추가
  void createReview({
    required String reviewContent,
    required Local local,
  }) async {
    final reviewRepository = ReviewRepository();
    final content = await reviewRepository.insert(
      title: local.title,
      content: reviewContent,
      mapX: local.mapX,
      mapY: local.mapY,
    );
  }

  // 리뷰 갱신
  void getAllReviews({required Local local}) async {
    final reviewRepository = ReviewRepository();
    final reviews = reviewRepository.reviewStream(
      mapX: local.mapX,
      mapY: local.mapY,
    );
    final streamSubscription = reviews.listen((event) {
      state = event;
    });

    ref.onDispose(() {
      streamSubscription.cancel();
    });
  }
}
