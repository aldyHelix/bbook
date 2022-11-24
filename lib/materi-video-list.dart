import 'dart:convert';

import 'package:bbook/video-view.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MateriVideoList extends StatelessWidget {
  final int materiId;

  MateriVideoList({
    Key? key,
    required this.materiId,
  }) : super(key: key);

  Future<List<dynamic>> fetchVideo() async {
    final url = 'http://103.174.115.36/api/materi-video/$materiId';
    var result = await http.get(Uri.parse(url));
    return json.decode(result.body)['data'];
  }

  String _videoName(dynamic materi) {
    return materi['video_name'];
  }

  int _materiId(dynamic materi) {
    return materi['materi_id'];
  }

  String _youtubeId(dynamic materi) {
    var videoId = YoutubePlayer.convertUrlToId(materi['video_url']);
    return videoId.toString();
  }

  String _youtubeThumbnail(dynamic materi) {
    var videoId = YoutubePlayer.convertUrlToId(materi['video_url']);
    return 'https://img.youtube.com/vi/$videoId/0.jpg';
  }

  @override
  Widget build(BuildContext context) {
    final backButton = Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        icon: const Icon(Icons.chevron_left),
        iconSize: 24,
        onPressed: () {
          Navigator.pop(context);
        },
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.17),
      ),
    );

    final materiVideoList = Expanded(
      flex: 2,
      //padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      //height: MediaQuery.of(context).size.height,
      child: FutureBuilder<List<dynamic>>(
        future: fetchVideo(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                padding: EdgeInsets.all(0),
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  print(snapshot.data[index]);
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
                            padding: EdgeInsets.all(7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image(
                                    alignment: Alignment.centerLeft,
                                    image: NetworkImage(_youtubeThumbnail(
                                        snapshot.data[index])),
                                    height: 80,
                                    width: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.63,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          _videoName(snapshot.data[index]),
                                          maxLines: 5,
                                          overflow: TextOverflow.visible,
                                        ),
                                        padding: EdgeInsets.all(5),
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
                                builder: (context) => VideoMateri(
                                  youtubeId: _youtubeId(snapshot.data[index]),
                                  materiId: _materiId(snapshot.data[index]),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );

    final body = GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 24, right: 24, left: 24),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            HexColor('#E2B091'),
            HexColor('#F7DFD4'),
          ]),
        ),
        child: Column(
          //mainAxisSize: MainAxisSize.max,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //searchBar,
            backButton, SizedBox(height: 18.0),
            materiVideoList
          ],
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: body,
    );
  }
}
