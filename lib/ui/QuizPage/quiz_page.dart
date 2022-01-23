import 'package:english_quiz/modal/categories.dart';
import 'package:english_quiz/modal/question.dart';
import 'package:english_quiz/ui/constants.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  QuizPage({
    Key? key,
    /*required this.questions, required this.category*/
  }) : super(key: key);
  // List<Question> questions;
  // Category category;
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.blue,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: const Text("1/50"),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(
                    top: 10, right: 6, left: 6, bottom: 16),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: kRedColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text("Sorular Gelecek"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
