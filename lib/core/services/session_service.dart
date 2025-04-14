import 'package:get_storage/get_storage.dart';

class SessionService {
  final _storage = GetStorage();

  static const _isLoggedIn = 'is_logged_in';
  static const _username = 'username';

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
  }

  String getUsername() {
    return _storage.read(_username) ?? '';
  }
}
