import 'package:flutter/material.dart';

class WriteReviewBox extends StatelessWidget {
  const WriteReviewBox({
    super.key,
  });

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
      child: TextField(
        maxLines: 1,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: '리뷰를 작성해 주세요',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
