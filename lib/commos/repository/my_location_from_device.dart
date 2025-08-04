import 'package:geolocator/geolocator.dart';

class MyLocationFromDevice {
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
