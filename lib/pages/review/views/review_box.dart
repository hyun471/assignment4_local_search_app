import 'package:assignment4_local_search_app/commos/models/local.dart';
import 'package:assignment4_local_search_app/commos/models/review.dart';
import 'package:assignment4_local_search_app/pages/review/viewmodels/review_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 리뷰를 담는 박스 위젯
class ReviewBox extends StatelessWidget {
  Review review;
  Local local;
  ReviewBox({required this.review, required this.local});

  @override
  Widget build(BuildContext context) {
    // 리뷰를 담는 박스 위젯
    return Container(
      constraints: BoxConstraints(minHeight: 100),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border:
              Border.all(color: Color(0xffEFECEF), width: 2)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review.content,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  review.date.toIso8601String(),
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          // 삭제 아이콘 위젯
          Positioned(
            top: -6,
            right: -4,
            child: Consumer(
              builder: (context, ref, child) {
                final reviewState = ref.watch(
                    reviewViewModelProvider(local).notifier);
                return GestureDetector(
                  onTap: () {
                    TextEditingController textEditingController =
                        TextEditingController();
                    showDialog(
                      context: context,
                      builder: (context) {
                        // 아이콘 클릭시 나오는 팝업
                        return AlertDialog(
                          title: Text('리뷰를 삭제하시겠습니까?'),
                          content: TextField(
                              maxLines: 1,
                              maxLength: 4,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter
                                    .digitsOnly
                              ],
                              controller: textEditingController,
                              decoration: InputDecoration(
                                hintText: '비밀번호를 입력해 주세요',
                                hintStyle: TextStyle(
                                    color: Colors.grey),
                              )),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('취소')),
                            TextButton(
                                onPressed: () async {
                                  final check = await reviewState
                                      .deleteReview(
                                          password:
                                              textEditingController
                                                  .text,
                                          review: review);
                                  if (check != true) {
                                    return showDialog(
                                      context: context,
                                      builder: (context) =>
                                          AlertDialog(
                                        title: Text(
                                            '비밀번호가 올바르지 않습니다.'),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                textEditingController
                                                    .clear();
                                                Navigator.pop(
                                                    context);
                                              },
                                              child: Text('확인'))
                                        ],
                                      ),
                                    );
                                  }
                                  reviewState.getAllReviews(
                                      local: local);
                                  Navigator.pop(context);
                                },
                                child: Text('삭제')),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    color: Colors.transparent,
                    child: Icon(Icons.close_rounded),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
