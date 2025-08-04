import 'package:assignment4_local_search_app/commos/models/local.dart';
import 'package:assignment4_local_search_app/commos/repository/local_repository.dart';
import 'package:assignment4_local_search_app/commos/repository/my_location_from_device.dart';
import 'package:assignment4_local_search_app/commos/repository/my_location_repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:riverpod/riverpod.dart';

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

  Future<void> searchLocation(String query) async {
    final localRepository = LocationRepository();
    final locals = await localRepository.searchLocation(query);
    state = HomeState(locals);
  }

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
