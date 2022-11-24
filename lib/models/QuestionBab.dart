import 'package:http/http.dart';

class QuestionBab {
  final int id, answer, bab;
  final String question, header, image;
  final List<dynamic> options;

  QuestionBab(
      {required this.id,
      required this.question,
      required this.answer,
      required this.options,
      required this.header,
      required this.image,
      required this.bab});

  factory QuestionBab.fromJson(Map<String, dynamic> json) {
    return QuestionBab(
        id: json['id'],
        answer: json['answer_index'],
        bab: json['bab'],
        header: json['header'],
        image: json['image'],
        options: json['option'],
        question: json['question']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'answer': answer,
      'option': options,
      'header': header,
      'image': image,
      'bab': bab
    };
  }
}
