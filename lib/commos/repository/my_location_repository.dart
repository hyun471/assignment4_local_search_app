// https://api.vworld.kr/req/search?key=인증키&[검색API 요청파라미터]

// key  8EBB813C-B5A3-386D-828C-69594065C1B4

import 'dart:convert';

import 'package:assignment4_local_search_app/commos/models/location.dart';
import 'package:http/http.dart';

class MyLocationRepository {
  Future<Location?> searchMyLocation(
      String mapX, String mapY) async {
    final client = Client();
    final response = await client.get(Uri.parse(
      'https://api.vworld.kr/req/address?service=address&request=getAddress&key=8EBB813C-B5A3-386D-828C-69594065C1B4&point=$mapX,$mapY&version=2.0&format=json&type=ROAD',
    ));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      Map<String, dynamic> map = data['response'];
      final mylocation = List.from(map['result']);
      final address = mylocation[0]['structure'];
      final myAddress =
          '${address['level0']} ${address['level1']} ${address['level2']} ${address['level3']}';
      return Location(myLocation: myAddress);
    }
    print(response.statusCode);
    return null;
  }
}
