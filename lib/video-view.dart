import 'dart:convert';

import 'package:bbook/constants.dart';
import 'package:bbook/quiz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;

class VideoMateri extends StatelessWidget {
  final String youtubeId;
  final int materiId;

  const VideoMateri({Key? key, required this.youtubeId, required this.materiId})
      : super(key: key);

  Future<dynamic> fetchUsers() async {
    final url = 'http://103.174.115.36/api/materi/$materiId';
    var result = await http.get(Uri.parse(url));
    return json.decode(result.body)['data'];
  }

  String _konten(dynamic materi) {
    return materi['konten'];
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
        //padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.18),
      ),
    );

    final textDeskripsi = FutureBuilder<dynamic>(
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

    // ignore: unused_local_variable
    final quizButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: () {
          //Navigator.of(context).pop();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Quiz()),
          );
        },
        child: Container(
          child: Text(
            "Take Quiz",
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

    final videoScene = YoutubePlayer(
      controller: YoutubePlayerController(
        initialVideoId: youtubeId, //Add videoID.
        flags: YoutubePlayerFlags(
          hideControls: true,
          controlsVisibleAtStart: false,
          autoPlay: true,
          mute: false,
        ),
      ),
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.red,
    );

    final cardContent = Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        padding: EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [textDeskripsi],
          ),
        ),
      ),
    );

    final body = GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
            top: 50, right: 24, left: 24, bottom: kDefaultPadding),
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
            backButton, videoScene, SizedBox(height: kDefaultPadding),
            cardContent
          ],
        ),
      ),
    );

    return new Scaffold(body: body);
  }
}
