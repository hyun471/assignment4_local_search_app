import 'package:assignment4_local_search_app/commos/models/local.dart';
import 'package:assignment4_local_search_app/commos/repository/local_repository.dart';
import 'package:riverpod/riverpod.dart';

class HomeState {
  List<Local> locals;
  HomeState(this.locals);
}

class HomeViewModel extends Notifier<HomeState> {
  @override
  HomeState build() {
    return HomeState([]);
  }

  Future<void> searchLocal(String query) async {
    final locationRepository = LocationRepository();
    final locations =
        await locationRepository.searchLocation(query);
    state = HomeState(locations);
  }
}

final homeViewModelProvider =
    NotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel();
});
