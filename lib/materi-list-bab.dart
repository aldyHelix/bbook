//import 'package:bbook/materi-view.dart';
//import 'package:bbook/src/model/materi_model.dart';
import 'package:bbook/materi-view.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MateriBab extends StatelessWidget {
  final int bab;

  MateriBab({Key? key, required this.bab}) : super(key: key);

  final String url = 'http://103.174.115.36/';

  // static String get bab => bab;
  //final String apiUrl = "https://randomuser.me/api/?results=10";

  Future<List<dynamic>> fetchBab() async {
    final String apiUrl = 'http://103.174.115.36/api/materi/bab/$bab';
    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body)['data'];
  }

  String _namaMateri(dynamic materi) {
    return materi['nama_materi'];
  }

  String _image(dynamic materi) {
    return url + '/uploads/materi/' + materi['image'];
  }

  String _header(dynamic materi) {
    return materi['header'];
  }

  String _id(dynamic materi) {
    return materi['id'].toString();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable

    final backButton = Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        icon: const Icon(Icons.chevron_left),
        iconSize: 24,
        onPressed: () {
          Navigator.pop(context);
        },
        //padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.18),
      ),
    );

    final searchBar = TextField(
      style: TextStyle(
        fontSize: 14.0,
        color: Colors.blueAccent,
      ),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.all(0.0),
          child: Icon(
            Icons.search,
            color: Colors.grey,
          ), // icon is 48px widget.
        ),
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
        hintText: "pencarian",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(8.0),
        ),
        fillColor: HexColor('#EABCAC'),
      ),
    );

    final materiLists = MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Container(
        // height: MediaQuery.of(context).size.height,
        child: FutureBuilder<List<dynamic>>(
          future: fetchBab(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  // padding: EdgeInsets.all(0),
                  // scrollDirection: Axis.vertical,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: <Widget>[
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 5,
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image(
                                        alignment: Alignment.center,
                                        image: NetworkImage(
                                            _image(snapshot.data[index])),
                                        height: 80,
                                        width: 80,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.63,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              _namaMateri(snapshot.data[index]),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            padding: EdgeInsets.all(5),
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              _header(snapshot.data[index]),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                            padding: EdgeInsets.only(
                                                left: 5, right: 5),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MateriView(
                                            code: _id(snapshot.data[index]),
                                            isQrcode: false,
                                          )),
                                );
                              },
                            ),
                          ],
                        ));
                  });
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );

    final body = GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 40, right: 24, left: 24),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            HexColor('#E2B091'),
            HexColor('#F7DFD4'),
          ]),
        ),
        child: SingleChildScrollView(
          // scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          child: Column(
            children: <Widget>[
              //searchBar,
              // SizedBox(height: 18.0),
              backButton,
              materiLists
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
