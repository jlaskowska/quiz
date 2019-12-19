import 'package:html_unescape/html_unescape.dart';
import 'package:meta/meta.dart';

class Question {
  final String category;
  final String type;
  final String difficulty;
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;

  Question({
    @required this.category,
    @required this.type,
    @required this.difficulty,
    @required this.question,
    @required this.correctAnswer,
    @required this.incorrectAnswers,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        category: json['category'],
        type: json['type'],
        difficulty: json['difficulty'],
        question: HtmlUnescape().convert(json['question']),
        correctAnswer: json['correct_answer'],
        incorrectAnswers: List<String>.from(json['incorrect_answers'].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        'category': category,
        'type': type,
        'difficulty': difficulty,
        'question': question,
        'correct_answer': correctAnswer,
        'incorrect_answers': List<dynamic>.from(incorrectAnswers.map((x) => x)),
      };

  @override
  String toString() => toJson().toString();
}
