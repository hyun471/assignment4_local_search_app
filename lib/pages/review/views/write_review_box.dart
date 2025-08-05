import 'package:assignment4_local_search_app/commos/models/local.dart';
import 'package:assignment4_local_search_app/pages/review/viewmodels/review_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 리뷰 작성하는 박스 위젯
class WriteReviewBox extends StatelessWidget {
  Local local;
  WriteReviewBox({required this.local});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController =
        TextEditingController();
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
          // 리뷰 작성 위젯
          return TextField(
            maxLines: 1,
            controller: textEditingController,
            textInputAction: TextInputAction.done,
            onSubmitted: (text) async {
              // 작성 완료 시 나타나는 비밀번호 설정 팝업
              if (text.isEmpty) {
                return;
              } else {
                await showDialog(
                  context: context,
                  builder: (context) {
                    final TextEditingController
                        passwordController =
                        TextEditingController();
                    return AlertDialog(
                      title: Text('비밀번호 설정'),
                      content: TextField(
                        maxLines: 1,
                        maxLength: 4,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: '숫자 4자리를 입력해 주세요',
                          hintStyle:
                              TextStyle(color: Colors.grey),
                        ),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              return Navigator.pop(context);
                            },
                            child: Text('취소')),
                        TextButton(
                            onPressed: () async {
                              String password =
                                  passwordController.text;
                              await reviewState.createReview(
                                  reviewContent: text,
                                  local: local,
                                  password: password);
                              textEditingController.dispose();
                              return Navigator.pop(
                                  context, password);
                            },
                            child: Text('완료')),
                      ],
                    );
                  },
                );
              }
              // 리뷰 등록 완료 후 리뷰 리빌드
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
