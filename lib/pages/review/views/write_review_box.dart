import 'package:assignment4_local_search_app/commos/models/local.dart';
import 'package:assignment4_local_search_app/pages/review/viewmodels/review_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

class WriteReviewBox extends StatelessWidget {
  Local local;
  WriteReviewBox({required this.local});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      padding: EdgeInsets.only(top: 10, left: 20, right: 20),
      decoration: BoxDecoration(
          color: Color(0xffF8F2FB),
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(20))),
      child: Consumer(
        builder: (context, ref, child) {
          final reviewState =
              ref.read(reviewViewModelProvider(local).notifier);

          return TextField(
            maxLines: 1,
            textInputAction: TextInputAction.done,
            onSubmitted: (text) async {
              await reviewState.createReview(
                  reviewContent: text, local: local);
              reviewState.getAllReviews(local: local);
            },
            decoration: InputDecoration(
              hintText: '리뷰를 작성해 주세요',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          );
        },
      ),
    );
  }
}
