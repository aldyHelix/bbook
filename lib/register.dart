import 'package:bbook/login.dart';
import 'package:bbook/painter/curve_painter_2.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

//unused
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    final labelRegister = Container(
      child: Text(
        'Register',
        style: TextStyle(
            color: Colors.black, fontSize: 36, fontWeight: FontWeight.bold),
      ),
      alignment: Alignment.centerLeft,
    );

    final labelRegistertext = Container(
      child: Text(
        'To access this apps, you must fill all form',
        style: TextStyle(color: Colors.black87, fontSize: 16),
      ),
      alignment: Alignment.centerLeft,
    );

    final backButton = Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        icon: const Icon(Icons.chevron_left),
        iconSize: 24,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.17),
      ),
    );

    final registerForm = Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          autofocus: false,
          initialValue: 'alucard M',
          decoration: InputDecoration(
            hintText: 'Full Name',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
          ),
        ),
        SizedBox(height: 16.0),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          autofocus: false,
          initialValue: 'alucard@gmail.com',
          decoration: InputDecoration(
            hintText: 'Email',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
          ),
        ),
        SizedBox(height: 16.0),
        TextFormField(
          autofocus: false,
          initialValue: 'alucadass',
          decoration: InputDecoration(
            hintText: 'Username',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
          ),
        ),
        SizedBox(height: 16.0),
        TextFormField(
          autofocus: false,
          initialValue: 'some password',
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
          ),
        ),
        SizedBox(height: 84.0),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Icon(
                  Icons.error_outline,
                  size: 25,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  'By press register button, you accept all our Term and Condition ',
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              )
            ],
          ),
          alignment: Alignment.centerRight,
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Container(
                child: Text(
                  "Register".toUpperCase(),
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
          ),
        ),
      ],
    ));

    return Scaffold(
        body: Stack(
      children: <Widget>[
        CustomPaint(
          painter: CurvePainter2(),
          size: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height),
        ),
        Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 4,
                left: 24.0,
                right: 24.0),
            children: <Widget>[
              labelRegister,
              labelRegistertext,
              SizedBox(height: 31.0),
              registerForm
            ],
          ),
        ),
        backButton,
      ],
    ));
  }
}
