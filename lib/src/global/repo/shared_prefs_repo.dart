import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/src/core/core.dart';
import 'package:flutter_riverpod_base/src/models/user.dart';
import 'package:flutter_riverpod_base/src/utils/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPrefsRepoProvider =
    Provider<SharedPrefsRepo>((ref) => SharedPrefsRepo());

// TODO const your class, consider a singleton.
// TODO: this class only handle the user the name isn't accurate.
class SharedPrefsRepo {
  static const _tokenKey = "COOKIE_TOKEN";

  // TODO preferer static const like the above.
  final _currentUserKey = "CURRENT_USER";
  // TODO: don't abbreviate, use SHARED_PREFERENCES_REPOSITORY.
  final _name = "SHARED_PREFS_REPO";
  // TODO: you can use a the get keyword instead.
  Future<String?> getCookie() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final cookie = prefs.getString(_tokenKey);
    if (AppConfig.devMode) {
      log("Reading cookie", name: _name);
      log("Data : $cookie", name: _name);
    }

    return cookie;
  }

  // TODO: you can use a the get keyword instead.
  Future<User?> getCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_currentUserKey);
    if (AppConfig.devMode) {
      log("Reading user", name: _name);
      log("Data : $data", name: _name);
    }

    // TODO: your class fromJson already use jsonDecode.
    return data != null ? User.fromJson(jsonDecode(data)) : null;
  }

  // TODO: you can the set keyword instead.
  FutureVoid setCurrentUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (AppConfig.devMode) {
      log("Saving user", name: _name);
      log("Data : ${user.toJson()}", name: _name);
    }
    prefs.setString(_currentUserKey, jsonEncode(user.toJson()));
  }

  // TODO: you can the set keyword instead.
  FutureVoid setCookie(String cookie) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (AppConfig.devMode) {
      log("Saving cookie", name: _name);
      log("Data : $cookie", name: _name);
    }
    prefs.setString(_tokenKey, cookie);
  }

  FutureVoid clear() async {
    // TODO: too many redeclaration of prefs, consider extracting to init.
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
