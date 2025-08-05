import 'package:assignment4_local_search_app/commos/models/local.dart';
import 'package:assignment4_local_search_app/pages/review/viewmodels/review_view_model.dart';
import 'package:assignment4_local_search_app/pages/review/views/review_box.dart';
import 'package:assignment4_local_search_app/pages/review/views/write_review_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 리뷰 작성 페이지
class ReviewPage extends ConsumerStatefulWidget {
  Local local;
  ReviewPage({required this.local});

  @override
  ConsumerState<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends ConsumerState<ReviewPage> {
  // 리뷰 작성
  void creatReview(String text, String password) {
    ref
        .read(reviewViewModelProvider(widget.local).notifier)
        .createReview(
          reviewContent: text,
          local: widget.local,
          password: password,
        );
  }

  @override
  Widget build(BuildContext context) {
    final reviewState =
        ref.watch(reviewViewModelProvider(widget.local));
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: Text(
          widget.local.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: reviewState.reviews.length,
                itemBuilder: (context, index) {
                  final review = reviewState.reviews[index];
                  return ReviewBox(
                      review: review, local: widget.local);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 20);
                },
              ),
            ),
            WriteReviewBox(
              local: widget.local,
            )
          ],
        ),
      ),
    );
  }
}
