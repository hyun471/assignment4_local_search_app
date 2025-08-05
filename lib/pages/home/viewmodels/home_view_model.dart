import 'package:assignment4_local_search_app/commos/models/local.dart';
import 'package:assignment4_local_search_app/commos/repository/location_repository.dart';
import 'package:assignment4_local_search_app/commos/repository/my_location_from_device.dart';
import 'package:assignment4_local_search_app/commos/repository/my_location_repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:riverpod/riverpod.dart';

// 홈페이지에서 사용하는 상태관리
// 상태 클래스
class HomeState {
  List<Local> locals;
  HomeState(this.locals);
}

// 뷰모델
class HomeViewModel extends Notifier<HomeState> {
  @override
  HomeState build() {
    return HomeState([]);
  }

  /// 지역검색 후 검색 결과 상태에 저장
  Future<void> searchLocation(String query) async {
    final localRepository = LocationRepository();
    final locals = await localRepository.searchLocation(query);
    state = HomeState(locals);
  }

  /// 현재 디바이스 위치를 vworld API에서 지역명 받아서 네이버 API로 지역 검색 후 상태에 저장
  Future<void> onSearchMyCurrentLocation() async {
    final deviceLocation = MyLocationFromDevice();
    final currentMyPoint = MyLocationRepository();
    final currentMyLocation = LocationRepository();
    final Position pos =
        await deviceLocation.getCurrentlocation();
    final mapX = pos.longitude.toString();
    final mapY = pos.latitude.toString();
    print(mapX);
    final myPoint =
        await currentMyPoint.searchMyLocation(mapX, mapY);
    print(myPoint);
    final myLocation = await currentMyLocation
        .searchLocation(myPoint.toString());
    print(myLocation);
    state = HomeState(myLocation);
  }
}

// 뷰모델 관리자
final homeViewModelProvider =
    NotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel();
});
