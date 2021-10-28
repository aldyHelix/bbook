//import 'package:bbook/dashboard.dart';
import 'package:bbook/materi-video-list.dart';
import 'package:bbook/video-view.dart';
import 'package:flutter/material.dart';
import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:flutter_html/flutter_html.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';

// ignore: must_be_immutable
class MateriView extends StatelessWidget {
  final String code;
  final bool isQrcode;
  List<Widget> imageSlider;

  MateriView({Key key, @required this.code, this.isQrcode}) : super(key: key);

  final String imgUrl = 'https://bbook-application.xyz';

  Future<dynamic> fetchUsers() async {
    final url = isQrcode
        ? 'https://bbook-application.xyz/api/materi/qr/' + code
        : 'https://bbook-application.xyz/api/materi/' + code;
    var result = await http.get(Uri.parse(url));
    return json.decode(result.body)['data'];
  }

  int _materiId(dynamic materi) {
    return materi['id'];
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

  String _youtubeId(dynamic materi) {
    var videoId = YoutubePlayer.convertUrlToId(materi['video_stream']);
    return videoId;
  }

  bool _isNotEmptyVideo(dynamic materi) {
    if (materi['video_stream'] != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<dynamic> _fetchImage() async {
    final imageAPI = 'https://bbook-application.xyz/api/materi-image/$code';
    final res = await http.get(Uri.parse(imageAPI));
    return json.decode(res.body);
  }

  String _materiImage(dynamic materi) {
    return imgUrl + '/uploads/materi/' + materi['image_url'];
  }

  String _materiImageName(dynamic materi) {
    return materi['image_name'];
  }

  bool _isNotEmptyVideoList(dynamic materi) {
    if (materi['materi-video'] != null) {
      return true;
    } else {
      return false;
    }
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
      child: FutureBuilder<dynamic>(
          future: fetchUsers(),
          // ignore: missing_return
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (_isNotEmptyVideo(snapshot.data)) {
                return ElevatedButton(
                  onPressed: () {
                    //Navigator.of(context).pop();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => VideoMateri(
                                youtubeId: _youtubeId(snapshot.data),
                                materiId: _materiId(snapshot.data),
                              )),
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
                );
              } else {
                return Container();
              }
            } else {
              return ElevatedButton(
                onPressed: () {},
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
                      MaterialStateProperty.all<Color>(Colors.black54),
                ),
              );
            }
          }),
    );

    final materiVideoList = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: FutureBuilder<dynamic>(
          future: fetchUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (_isNotEmptyVideoList(snapshot.data)) {
                return ElevatedButton(
                  onPressed: () {
                    //Navigator.of(context).pop();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => MateriVideoList(
                                materiId: _materiId(snapshot.data),
                              )),
                    );
                  },
                  child: Container(
                    child: Text(
                      "Daftar Video Materi".toUpperCase(),
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
                );
              } else {
                return Container();
              }
            } else {
              return Container();
            }
          }),
    );

    final materiGallery = Container(
        child: FutureBuilder(
      future: _fetchImage(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return CarouselSlider.builder(
              itemCount: snapshot.data['data'].length,
              itemBuilder: (context, index, realIdx) {
                //print(snapshot.data['data'][index]);
                var imageData = snapshot.data['data'][index];
                return Container(
                  margin: EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: _materiImage(imageData),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                              value: downloadProgress.progress,
                            ),
                          ),
                          fit: BoxFit.cover,
                          width: 1000,
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              _materiImageName(imageData),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1));
        } else {
          print('data kosong');
          return Container();
        }
      },
    ));

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
            child: materiGallery,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(right: 25, left: 25, bottom: 25, top: 15),
            child: playButton,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(right: 25, left: 25, bottom: 25, top: 15),
            child: materiVideoList,
          ),
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
                              "Materi Bbook",
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
