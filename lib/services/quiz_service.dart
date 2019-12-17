import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz/models/question.dart';

class QuizService {
  static const _baseEndpoint = 'https://opentdb.com/api.php';

  Future<List<Question>> getQuestions(int count) async {
    final url = '$_baseEndpoint?amount=$count&type=boolean';

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonString = json.decode(response.body);

        final List<dynamic> questionsAsJsonList = jsonString['results'];
        if (questionsAsJsonList != null) {
          final List<Question> questions = questionsAsJsonList.map((item) => Question.fromJson(item)).toList();

          return questions;
        }
      }
    } catch (error) {
      print('An error occured: $error');
    }

    return null;
  }
}
