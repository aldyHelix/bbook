import 'dart:async';
import 'package:bbook/dashboard.dart';
import 'package:bbook/services/auth-service.dart';
//import 'package:bbook/login.dart';
import 'package:bbook/simple-login.dart';
//import 'package:bbook/main.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
//import 'package:bbook/constants.dart' as constant;
import 'package:shared_preferences/shared_preferences.dart';

AuthService appAuth = new AuthService();

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var duration = const Duration(seconds: 2);
    bool isLoggedin = prefs.getBool('isLoggedIn') ?? false;
    return Timer(duration, () {
      if (isLoggedin) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Dashboard()),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SimpleLogin()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#E2B091"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('images/bbook.png'),
              alignment: Alignment.center,
              height: 70,
              width: 205,
            ),
            // Icon(
            //   Icons.school,
            //   size: 100.0,
            //   color: Colors.white,
            // ),
            SizedBox(height: 24.0),
            Text(
              "By Jurusan Sejarah - FIS UM",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
