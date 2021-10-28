import 'package:bbook/models/Questions.dart';
import 'package:bbook/services/auth-service.dart';
import 'package:bbook/simple-login.dart';
import 'package:bbook/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AuthService appAuth = new AuthService();

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    SimpleLogin.tag: (context) => SimpleLogin()
  };

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'SFProText'),
      home: SplashScreen(),
    );
  }
}
