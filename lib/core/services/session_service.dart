import 'package:get_storage/get_storage.dart';

class SessionService {
  final _storage = GetStorage();

  static const _isLoggedIn = 'is_logged_in';
  static const _username = 'username';
  static const _stopwatchState = 'stopwatch_state';
  static const _favIndex = 'favorite_index';

  bool isLoggedIn() {
    return _storage.read(_isLoggedIn) ?? false;
  }

  Future login({
    required String username,
  }) async {
    await _storage.write(_username, username);
    await _storage.write(_isLoggedIn, true);
  }

  Future logout() async {
    await _storage.remove(_username);
    await _storage.write(_isLoggedIn, false);
    await _storage.remove(_stopwatchState);
    await _storage.remove(_favIndex);
  }

  String getUsername() {
    return _storage.read(_username) ?? '';
  }

Future saveStopwatchState(Map<String, dynamic> state) async {
  await _storage.write(_stopwatchState, state);
}

Map<String, dynamic>? getStopwatchState() {
  return _storage.read(_stopwatchState);
}

  Future removeStopwatchState() async {
    await _storage.remove(_stopwatchState);
  }

  List<int> getFav() {
    final rawFav = _storage.read<List>(_favIndex);
    return rawFav?.cast<int>() ?? [];
  }

  void saveFav(List<int> list) {
    _storage.write(_favIndex, list);
  }

  void addFav(int index) {
    final current = getFav();
    current.add(index);
    saveFav(current);
  }

  bool isFav(int index) {
    final current = getFav();
    return current.contains(index);
  }

  void removeFav(int index) {
    final current = getFav();
    current.remove(index);
    saveFav(current);
  }
}
