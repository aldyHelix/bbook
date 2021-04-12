import 'package:bbook/dashboard.dart';
//import 'package:bbook/main.dart';
import 'package:bbook/painter/curve_painter_1.dart';
import 'package:bbook/register.dart';
import 'package:flutter/material.dart';
//import 'package:bbook/home_page.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
        'Enter your username and Password',
        style: TextStyle(color: Colors.black87, fontSize: 16),
      ),
      alignment: Alignment.centerRight,
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: 'alucard@gmail.com',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      initialValue: 'some password',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: () {
          //Navigator.of(context).pop();
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

    final forgotLabel = TextButton(
      child: Text(
        'Register',
        style: TextStyle(
            color: Colors.black, fontSize: 19, fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Register()),
        );
      },
    );

    final bigOr = Container(
      child: Text(
        'Or',
        style: TextStyle(color: Colors.black38, fontSize: 16),
      ),
      alignment: Alignment.center,
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
                  top: MediaQuery.of(context).size.height / 3,
                  left: 24.0,
                  right: 24.0),
              children: <Widget>[
                textLogin,
                textOnly,
                SizedBox(height: 82.0),
                email,
                SizedBox(height: 22.0),
                password,
                SizedBox(height: 48.0),
                loginButton,
                SizedBox(height: 13.0),
                bigOr,
                SizedBox(height: 13.0),
                forgotLabel
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
