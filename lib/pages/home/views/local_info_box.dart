import 'package:assignment4_local_search_app/pages/review/review_page.dart';
import 'package:flutter/material.dart';

class LocalInfoBox extends StatelessWidget {
  int index;
  LocalInfoBox({required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return ReviewPage();
          },
        ));
      },
      child: Container(
        height: 110,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Color(0xffEFECEF),
              width: 2,
            )),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '삼성$index동 주민센터',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '공공,사회기관>행정복지센터',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                '서울특별시 강남구 봉은사로 616 삼성1동 주민센터',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
