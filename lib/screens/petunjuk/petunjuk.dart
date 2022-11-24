import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:bbook/constants.dart';
import 'package:http/http.dart' as http;

class Petunjuk extends StatelessWidget {
  const Petunjuk({Key? key}) : super(key: key);

  Future<List<dynamic>> fetchGuru() async {
    final String apiUrl = 'http://103.174.115.36/api/petunjuk/guru';
    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body)['data'];
  }

  Future<List<dynamic>> fetchSiswa() async {
    final String apiUrl = 'http://103.174.115.36/api/petunjuk/siswa';
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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding, vertical: kDefaultPadding),
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
              FutureBuilder<List<dynamic>>(
                future: fetchGuru(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return MediaQuery(
                      data:
                          MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        padding: EdgeInsets.all(kDefaultPadding),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              child: Text('PETUNJUK PENGGUNAAN UNTUK GURU'),
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
                    );
                  } else {
                    return Column(
                        children: [Center(child: CircularProgressIndicator())]);
                  }
                },
              ),
              SizedBox(height: 18.0),
              FutureBuilder<List<dynamic>>(
                future: fetchSiswa(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return MediaQuery(
                      data:
                          MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        padding: EdgeInsets.all(kDefaultPadding),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              child: Text('PETUNJUK PENGGUNAAN UNTUK SISWA'),
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
                    );
                  } else {
                    return Column(
                        children: [Center(child: CircularProgressIndicator())]);
                  }
                },
              ),
              SizedBox(height: 26.0),
            ],
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
