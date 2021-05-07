import 'package:bbook/quiz.dart';
import 'package:flutter/material.dart';
import 'package:bbook/video_item.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:video_player/video_player.dart';

class VideoMateri extends StatefulWidget {
  @override
  _VideoMateriState createState() => _VideoMateriState();
}

class _VideoMateriState extends State<VideoMateri> {
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
        //padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.18),
      ),
    );

    final playButton = Padding(
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

    return new Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 0, 20, 25),
        child: ListView(
          children: <Widget>[
            backButton,
            VideoItems(
              videoPlayerController: VideoPlayerController.network(
                  'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4'),
              looping: false,
              autoplay: true,
            ),
            playButton
          ],
        ),
      ),
    );
  }
}
