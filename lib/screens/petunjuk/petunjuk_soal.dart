import 'dart:convert';
import 'package:bbook/screens/quiz/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:bbook/constants.dart';
import 'package:http/http.dart' as http;

class PetunjukSoal extends StatelessWidget {
  const PetunjukSoal({Key? key}) : super(key: key);

  Future<List<dynamic>> fetchSoal() async {
    final String apiUrl = 'http://103.174.115.36/api/petunjuk/soal';
    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body)['data'];
  }

  String _deskripsi(dynamic materi) {
    return materi['description'];
  }

  String _header(dynamic materi) {
    return materi['header'];
  }

  @override
  Widget build(BuildContext context) {
    final body = GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 50, right: 24, left: 24),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              HexColor('#E2B091'),
              HexColor('#F7DFD4'),
            ]),
          ),
          child: FutureBuilder<List<dynamic>>(
            future: fetchSoal(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: kDefaultPadding,
                          vertical: kDefaultPadding),
                      height: 100,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage('images/bbook.png'),
                              alignment: Alignment.center,
                              scale: 3),
                          color: HexColor('#482428'),
                          borderRadius: BorderRadius.circular(24)),
                    ),
                    SizedBox(height: 18.0),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      padding: EdgeInsets.all(kDefaultPadding),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            child: Text('PETUNJUK PENGERJAAN SOAL'),
                          ),
                          Divider(thickness: 1.5),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              text: _header(snapshot.data[0]),
                            ),
                          ),
                          Html(
                            data: _deskripsi(snapshot.data[0]),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 18.0),
                    ElevatedButton(
                      onPressed: () {
                        //Navigator.of(context).pop();
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => QuizScreen()),
                        );
                      },
                      child: Container(
                        child: Text(
                          "Mulai Quiz".toUpperCase(),
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
                        backgroundColor: MaterialStateProperty.all<Color>(
                            HexColor('#E2B091')),
                      ),
                    )
                  ],
                );
              } else {
                return Column(
                    children: [Center(child: CircularProgressIndicator())]);
              }
            },
          ),
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: body,
    );
  }
}
