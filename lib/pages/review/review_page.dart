import 'package:assignment4_local_search_app/commos/models/local.dart';
import 'package:assignment4_local_search_app/pages/review/views/review_box.dart';
import 'package:assignment4_local_search_app/pages/review/views/write_review_box.dart';
import 'package:flutter/material.dart';

class ReviewPage extends StatelessWidget {
  Local local;
  ReviewPage({required this.local});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: Text(
          local.title,
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
                itemCount: 3,
                itemBuilder: (context, index) {
                  List<int> count = [1, 2, 3, 4, 5];
                  int countIndex = count[index];
                  return ReviewBox(countIndex);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 20);
                },
              ),
            ),
            WriteReviewBox()
          ],
        ),
      ),
    );
  }
}
