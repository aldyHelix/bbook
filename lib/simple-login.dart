import 'package:bbook/dashboard.dart';
import 'package:bbook/painter/curve_painter_1.dart';
import 'package:bbook/services/auth-service.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants.dart' as constant;

AuthService appAuth = new AuthService();

class SimpleLogin extends StatefulWidget {
  static String tag = 'simplelogin-page';
  @override
  State<StatefulWidget> createState() => new _SimpleLoginState();
}

class _SimpleLoginState extends State<SimpleLogin> {
  TextEditingController nameController = TextEditingController();

  bool isLoggedIn = false;
  String name = '';

  @override
  void initState() {
    super.initState();
    autoLogIn();
  }

  void autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userId = prefs.getString('username');

    if (userId != null) {
      setState(() {
        isLoggedIn = true;
        name = userId;
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textLogin = Container(
      child: Text(
        'Login',
        style: TextStyle(
            color: Colors.black, fontSize: 36, fontWeight: FontWeight.bold),
      ),
      alignment: Alignment.centerRight,
    );

    final textOnly = Container(
      child: Text(
        'Enter your name here',
        style: TextStyle(color: Colors.black87, fontSize: 16),
      ),
      alignment: Alignment.centerRight,
    );

    final name = TextFormField(
      controller: nameController,
      keyboardType: TextInputType.name,
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'Your Name Here',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: () {
          appAuth.loginUser();
          constant.username = nameController.text;
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Dashboard()),
          );
        },
        child: Container(
          child: Text(
            "Login".toUpperCase(),
            style: TextStyle(fontSize: 19),
            textAlign: TextAlign.center,
          ),
          height: 55,
          alignment: Alignment.center,
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: HexColor('#E2B091')),
            ),
          ),
          backgroundColor:
              MaterialStateProperty.all<Color>(HexColor('#E2B091')),
        ),
      ),
    );
    return Scaffold(
        body: Stack(
      children: <Widget>[
        CustomPaint(
          painter: CurvePainter(),
          size: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 4,
                  left: 24.0,
                  right: 24.0),
              children: <Widget>[
                textLogin,
                textOnly,
                SizedBox(height: 82.0),
                name,
                SizedBox(height: 22.0),
                loginButton,
                SizedBox(height: 13.0),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
