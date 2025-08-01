import 'package:assignment4_local_search_app/commos/models/local.dart';
import 'package:assignment4_local_search_app/commos/repository/local_repository.dart';
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
}

// 뷰모델 관리자
final homeViewModelProvider =
    NotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel();
});
