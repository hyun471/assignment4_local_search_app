import 'package:assignment4_local_search_app/commos/models/local.dart';
import 'package:assignment4_local_search_app/commos/models/review.dart';
import 'package:assignment4_local_search_app/commos/repository/review_repository.dart';
import 'package:riverpod/riverpod.dart';

class ReviewState {
  List<Review> reviews;
  ReviewState(this.reviews);
}

// 뷰모델
class ReviewViewModel
    extends AutoDisposeFamilyNotifier<ReviewState, Local> {
  @override
  ReviewState build(local) {
    getAllReviews(local: local);
    return ReviewState([]);
  }

  final reviewRepository = ReviewRepository();

  // 리뷰 추가
  Future<void> createReview({
    required String reviewContent,
    required Local local,
    required String password,
  }) async {
    final content = await reviewRepository.insert(
      title: local.title,
      content: reviewContent,
      mapX: local.mapX,
      mapY: local.mapY,
      password: password,
    );
  }

  // 리뷰 불러오기
  void getAllReviews({required Local local}) async {
    final reviews = await reviewRepository.reviewStream(
      mapX: local.mapX,
      mapY: local.mapY,
    );
    state = ReviewState(reviews);
  }

  Future<bool> deleteReview(
      {required String password, required Review review}) async {
    return await reviewRepository.delete(
        id: review.id, password: password);
  }
}

// 뷰모델 관리자
final reviewViewModelProvider = NotifierProvider.autoDispose
    .family<ReviewViewModel, ReviewState, Local>(
  () {
    return ReviewViewModel();
  },
);
