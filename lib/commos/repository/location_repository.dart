import 'dart:convert';
import 'package:assignment4_local_search_app/commos/models/local.dart';
import 'package:http/http.dart';

class LocationRepository {
  Future<List<Location>> searchLocation(String query) async {
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
      final locations = List.from(map['items']);
      final iterable = locations.map((e) {
        return Location.fromJson(e);
      });
      final localList = iterable.toList();
      return localList;
    }
    print(response.statusCode);
    return [];
  }
}
