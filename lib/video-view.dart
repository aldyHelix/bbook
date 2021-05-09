import 'package:bbook/quiz.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoMateri extends StatelessWidget {
  final String youtubeId;
  final int materiId;

  const VideoMateri({Key key, this.youtubeId, this.materiId}) : super(key: key);

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

    return new Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 0, 20, 25),
        child: ListView(
          children: <Widget>[backButton, videoScene],
        ),
      ),
    );
  }
}
