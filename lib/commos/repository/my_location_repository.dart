import 'dart:convert';
import 'package:http/http.dart';

// 좌표를 통해 vworld API에서 지역명 데이터를 받아오는 클래스
class MyLocationRepository {
  /// 좌표를 통해 vworld API에서 지역명 데이터를 받아오는 메서드
  Future<String?> searchMyLocation(
      String mapX, String mapY) async {
    String key = '8EBB813C-B5A3-386D-828C-69594065C1B4';
    final client = Client();
    final response = await client.get(Uri.parse(
      'https://api.vworld.kr/req/data?request=GetFeature&key=$key&data=LT_C_ADEMD_INFO&geomFilter=POINT($mapX $mapY)',
    ));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      Map<String, dynamic> map =
          data['response']['result']['featureCollection'];
      final features = map['features'][0];
      final properties = features['properties'];
      final myAddress = properties['emd_kor_nm'].toString();
      return myAddress;
    }
    print(response.statusCode);
    return null;
  }
}
