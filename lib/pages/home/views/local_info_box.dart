import 'package:assignment4_local_search_app/commos/models/local.dart';
import 'package:assignment4_local_search_app/pages/review/review_page.dart';
import 'package:flutter/material.dart';

class LocalInfoBox extends StatelessWidget {
  Local local;
  LocalInfoBox({required this.local});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return ReviewPage(local: local);
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
                local.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                local.category,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                local.address,
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
