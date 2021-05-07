//import 'package:bbook/dashboard.dart';
import 'package:bbook/video-view.dart';
import 'package:flutter/material.dart';
import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MateriView extends StatelessWidget {
  final String code;
  final bool isQrcode;

  MateriView({Key key, @required this.code, this.isQrcode}) : super(key: key);

  final String imgUrl = 'https://bbook-application.xyz';

  Future<dynamic> fetchUsers() async {
    final url = isQrcode
        ? 'https://bbook-application.xyz/api/materi/qr/' + code
        : 'https://bbook-application.xyz/api/materi/' + code;
    var result = await http.get(url);
    return json.decode(result.body)['data'];
  }

  String _nameMateri(dynamic materi) {
    return materi['nama_materi'];
  }

  String _image(dynamic materi) {
    return imgUrl + '/uploads/materi/' + materi['image'];
  }

  String _header(dynamic materi) {
    return materi['header'];
  }

  String _konten(dynamic materi) {
    return materi['konten'];
  }

  @override
  Widget build(BuildContext context) {
    final backButton = Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        icon: const Icon(Icons.arrow_back),
        iconSize: 24,
        onPressed: () {
          Navigator.pop(context);
        },
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.17),
      ),
    );

    final text = FutureBuilder<dynamic>(
      future: fetchUsers(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          print(_konten(snapshot.data));
          return Html(
            data: _konten(snapshot.data),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );

    final drawLine = Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        height: 4.0,
        width: 130.0,
      ),
    );

    final playButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: () {
          //Navigator.of(context).pop();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => VideoMateri()),
          );
        },
        child: Container(
          child: Text(
            "Play Video Materi".toUpperCase(),
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

    final body = ListView(
      shrinkWrap: true,
      children: <Widget>[
        Align(
          child: Container(
            padding: EdgeInsets.only(
              //top: MediaQuery.of(context).size.height / 4,
              left: 24.0,
              right: 24.0,
              bottom: 24.0,
            ),
            child:
                //contenthere
                text,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 60,
            width: 60,
            child: SvgPicture.asset('images/icons/book.svg'),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
              padding:
                  EdgeInsets.only(right: 25, left: 25, bottom: 25, top: 15),
              child: playButton),
        ),
      ],
    );

    final appBarCollapse = NestedScrollView(
      body: body,
      floatHeaderSlivers: true,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: HexColor('#F7DFD4'),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  backButton,
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 10, 20, 25),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: FutureBuilder<dynamic>(
                        future: fetchUsers(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              _nameMateri(snapshot.data),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            );
                          } else {
                            return Text(
                              "Name Not Found",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Container(
                    child: FutureBuilder<dynamic>(
                        future: fetchUsers(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: DropCapText(
                                    _header(snapshot.data),
                                    style: TextStyle(fontSize: 14, height: 1.4),
                                    dropCapPadding:
                                        EdgeInsets.only(right: 21, bottom: 16),
                                    dropCap: DropCap(
                                      width: 150,
                                      height: 200,
                                      child: FutureBuilder<dynamic>(
                                        future: fetchUsers(),
                                        builder: (BuildContext context,
                                            AsyncSnapshot snapshot) {
                                          if (snapshot.hasData) {
                                            print(_konten(snapshot.data));
                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image(
                                                alignment: Alignment.centerLeft,
                                                image: NetworkImage(
                                                    _image(snapshot.data)),
                                                fit: BoxFit.cover,
                                              ),
                                            );
                                          } else {
                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image(
                                                alignment: Alignment.centerLeft,
                                                image: AssetImage(
                                                    'images/image1.png'),
                                                fit: BoxFit.cover,
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  padding:
                                      const EdgeInsets.fromLTRB(25, 10, 20, 50),
                                ),
                              ],
                            );
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        }),
                    // ignore: missing_return
                  ),
                  drawLine,
                ],
              ),
            ),
          ),
        ];
      },
    );

    return Scaffold(
      body: appBarCollapse,
    );
  }
}
