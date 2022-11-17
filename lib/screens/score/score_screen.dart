import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bbook/constants.dart';
import 'package:bbook/controllers/question_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class ScoreScreen extends StatelessWidget {
  ScoreScreen();

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(right: 10, left: 10, bottom: 50),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          HexColor('#E2B091'),
          HexColor('#F7DFD4'),
        ]),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              Spacer(flex: 3),
              Text(
                "Nilai Skor",
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(color: kSecondaryColor),
              ),
              Spacer(),
              Text(
                "${_qnController.numOfCorrectAns * 10}/${_qnController.questions.length * 10}",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: kSecondaryColor),
              ),
              Spacer(),
              TextButton(
                  onPressed: _qnController.backToDashboard,
                  child: Text("Kembali ke halaman utama.")),
              Spacer(flex: 3),
            ],
          )
        ],
      ),
    ));
  }
}
