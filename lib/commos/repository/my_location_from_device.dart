import 'package:geolocator/geolocator.dart';

// 디바이스에서 현재 위치 좌표를 받아오는 클래스
class MyLocationFromDevice {
  // 디바이스의 현재 위치 좌표 찾는 메서드
  Future<Position> getCurrentlocation() async {
    // 1. 위치 서비스 켜져 있는지 확인
    final isLocationService =
        Geolocator.isLocationServiceEnabled();
    if (!await isLocationService) {
      throw Exception('위치 서비스 꺼짐');
    }

    // 2. 권한 확인 및 요청
    LocationPermission permission =
        await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('권한 거부됨');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      throw Exception('권한 영구 거부됨');
    }
    // 3. 현재 위치 반환
    return await Geolocator.getCurrentPosition(
        locationSettings:
            LocationSettings(accuracy: LocationAccuracy.high));
  }
}
