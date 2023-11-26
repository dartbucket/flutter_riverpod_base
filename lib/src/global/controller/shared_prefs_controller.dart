import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/src/core/core.dart';
import 'package:flutter_riverpod_base/src/global/repo/shared_prefs_repo.dart';
import 'package:flutter_riverpod_base/src/models/user.dart';

// TODO: prefer class over global variables.
final sharedPrefsControllerPovider = Provider((ref) {
  final repo = ref.watch(sharedPrefsRepoProvider);

  return SharedPrefsController(repo: repo);
});

// TODO: this class looks like handle the user only the name isn't accurate.
class SharedPrefsController {
  final SharedPrefsRepo _repo;

  SharedPrefsController({required SharedPrefsRepo repo}) : _repo = repo;

  // TODO use the the get keyword Future<User?> get user async => _repo.getCookie();.

  Future<String?> getCookie() {
    return _repo.getCookie();
  }

  FutureVoid setCookie({required String cookie}) async {
    await _repo.setCookie(cookie);
  }

  // TODO use the the get keyword Future<User?> get user async => _repo.getCurrentUser();.
  Future<User?> getUser() {
    return _repo.getCurrentUser();
  }

  // TODO: this might not always succeed, add a try catch block.
  FutureVoid setUser({required User user}) {
    _repo.setCurrentUser(user);
  }

  FutureVoid clear() {
    return _repo.clear();
  }
}
