import 'dart:async';
//import 'dart:math';
import 'package:bbook/constants.dart' as constant;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  //login

  Future<Null> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', null);
    prefs.setBool('isLoggedIn', true);
    constant.username = '';
    constant.isLoggedIn = false;
  }

  Future<Null> loginUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', constant.username);
    prefs.setBool('isLoggedIn', true);
  }
}
