import 'dart:convert';
import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/src/core/core.dart';
import 'package:flutter_riverpod_base/src/models/user.dart';
import 'package:flutter_riverpod_base/src/utils/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPrefsRepoProvider = Provider<SharedPrefsRepo>((ref) => SharedPrefsRepo());

class SharedPrefsRepo {
  final String _tokenKey = "COOKIE_TOKEN";
  final String _currentUserKey = "CURRENT_USER";
  final _name = "SHARED_PREFS_REPO";

  Future<String?> getCookie() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final cookie = prefs.getString(_tokenKey);
    if(AppConfig.devMode){
      log("Reading cookie", name: _name);
      log("Data : $cookie", name: _name);
    }
    return cookie;
  }

  Future<User?> getCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_currentUserKey);
    if(AppConfig.devMode){
      log("Reading user", name: _name);
      log("Data : $data", name: _name);
    }
    final user = data != null ? User.fromJson(jsonDecode(data)): null;
    return user;
  }

  FutureVoid setCurrentUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(AppConfig.devMode){
      log("Saving user", name: _name);
      log("Data : ${user.toJson()}", name: _name);
    }
    prefs.setString(_currentUserKey, jsonEncode(user.toJson()));
  }

  FutureVoid setCookie(String cookie) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(AppConfig.devMode){
      log("Saving cookie", name: _name);
      log("Data : $cookie", name: _name);
    }
    prefs.setString(_tokenKey, cookie);
  }

  FutureVoid clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}