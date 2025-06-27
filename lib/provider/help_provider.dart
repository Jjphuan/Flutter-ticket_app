import 'package:GoTravel/custom/endpoint.dart';
import 'package:GoTravel/custom/http_parse.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HelpProvider extends ChangeNotifier{

  List<dynamic> _questionList = [];

  Future<void> getQuestionList(BuildContext context) async {
    _questionList = []; // Optional: clear old data
    notifyListeners();  // Let UI know it’s empty first

    try {
      Response response = await HttpParse().get(
        Endpoint.question,
      );

      final result = response.data;

      if (result['success']) {
        _questionList = result['message'];
        notifyListeners();
      }
    } catch (e) {
      print("Failed to load questions: $e");
    }
  }


  List<dynamic> get questionList => _questionList;
}