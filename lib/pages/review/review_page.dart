import 'package:assignment4_local_search_app/commos/models/local.dart';
import 'package:assignment4_local_search_app/pages/review/views/review_box.dart';
import 'package:assignment4_local_search_app/pages/review/views/write_review_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReviewPage extends ConsumerStatefulWidget {
  Local local;
  ReviewPage({required this.local});

  @override
  ConsumerState<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends ConsumerState<ReviewPage> {
  TextEditingController textEditingController =
      TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
