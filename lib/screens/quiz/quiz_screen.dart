import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bbook/controllers/question_controller.dart';
import 'package:hexcolor/hexcolor.dart';

import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          // Fluttter show the back button automatically
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            TextButton(
                onPressed: _controller.nextQuestion, child: Text("Lewati")),
          ],
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
        ));
  }
}
