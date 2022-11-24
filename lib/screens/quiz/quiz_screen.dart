import 'package:bbook/screens/score/score_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bbook/controllers/question_controller.dart';
import 'package:hexcolor/hexcolor.dart';

import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());

    if (_controller.questionNumber >= 30) {
      return ScoreScreen();
    }

    Future<bool> _onWillPop() async {
      return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: new Text('Yakin ingin kembali?'),
              content: new Text(
                  'Quiz yang sudah dimulai tidak dapat kembali ke halaman awal dan quiz akan ter reset kembali. silahkan tutup aplikasi dan buka kembali.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => {
                    _controller.onStop(),
                    Navigator.of(context).pop(false) //<-- SEE HERE
                  },
                  child: new Text('Tidak!'),
                ),
                TextButton(
                  onPressed: () =>
                      Navigator.of(context).pop(true), // <-- SEE HERE
                  child: new Text('Ya!'),
                ),
              ],
            ),
          )) ??
          false; //<-- SEE HERE
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          // Fluttter show the back button automatically
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            TextButton(
                onPressed: _controller.nextQuestion, child: Text("Lewati")),
          ],
          // leading: new IconButton(
          //     icon: new Icon(Icons.chevron_left),
          //     onPressed: () => _controller.backToDashboard()),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(right: 10, left: 10, bottom: 50),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              HexColor('#E2B091'),
              HexColor('#F7DFD4'),
            ]),
          ),
          child: Body(),
        ),
      ),
    );
  }
}
