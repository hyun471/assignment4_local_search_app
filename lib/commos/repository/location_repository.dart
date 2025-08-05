import 'dart:convert';
import 'package:assignment4_local_search_app/commos/models/local.dart';
import 'package:http/http.dart';

// 검색어를 통해 네이버 API에서 데이터 받아오고 가공하는 클래스
class LocationRepository {
  /// 문자를 받아 검색하여 해당 데이터들을 받아오는 메서드
  Future<List<Local>> searchLocation(String query) async {
    final client = Client();
    final response = await client.get(
        Uri.parse(
          'https://openapi.naver.com/v1/search/local.json?display=5&start=1&query=$query',
        ),
        headers: {
          'X-Naver-Client-Id': 'k62MHnngSkXX54sCyv3f',
          'X-Naver-Client-Secret': 'qeQT2hj1gT',
        });
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      final locals = List.from(map['items']);
      final iterable = locals.map((e) {
        return Local.fromJson(e);
      });
      final localList = iterable.toList();
      return localList;
    }
    print(response.statusCode);
    return [];
  }
}
