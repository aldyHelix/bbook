import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:bbook/dashboard.dart';
import 'package:bbook/models/QuestionBab.dart';
import 'package:bbook/models/Questions.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:bbook/screens/score/score_screen.dart';
import 'package:http/http.dart' as http;

// We use get package for our state management

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // Lets animated our progress bar

  late AnimationController _animationController;
  late Animation _animation;
  // so that we can access our animation outside
  Animation get animation => this._animation;

  late PageController _pageController;
  PageController get pageController => this._pageController;

  List<Question> _questions = sample_data
      .map(
        (question) => Question(
            id: question['id'],
            header: question['header'],
            question: question['question'],
            options: question['options'],
            image: question['image'],
            answer: question['answer_index']),
      )
      .toList();

  // Future<QuestionBab> get q => fetchQuizBab(1);

  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  late int _correctAns;
  int get correctAns => this._correctAns;

  late int _selectedAns;
  int get selectedAns => this._selectedAns;

  // for more about obs please check documentation
  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  // called immediately after the widget is allocated memory
  @override
  void onInit() {
    // Our animation duration is 60 s
    // so our plan is to fill the progress bar within 60s
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        // update like setState
        update();
      });

    // start our animation
    // Once 60s is completed go to the next qn
    _animationController.forward().whenComplete(nextQuestion);
    update();
    _pageController = PageController();
    super.onInit();
  }

  // // called just before the Controller is deleted from memory
  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void onStop() {
    _animationController.stop();
  }

  void checkAns(Question question, int selectedIndex) {
    // because once user press any option then it will run
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) _numOfCorrectAns++;

    // It will stop the counter
    _animationController.stop();
    update();

    // Once user select an ans after 3s it will go to the next qn
    Future.delayed(Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;

      Completer<bool> completer = new Completer<bool>();

      /// Callback called after widget has been fully built
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        completer.complete(true);
        if (_pageController.positions.isNotEmpty) {
          _pageController.nextPage(
              duration: Duration(milliseconds: 250), curve: Curves.ease);
        }
      });

      // Reset the counter
      _animationController.reset();

      // Then start it again
      // Once timer is finish go to the next qn
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      // Get package provide us simple way to naviigate another page
      new PageController();
      Get.to(() => ScoreScreen());
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }

  void onContinue() {
    _animationController.reset();
  }

  void backToDashboard() {
    new PageController();
    Get.to(() => Dashboard());
  }
}
