import 'package:english_quiz/modal/question.dart';
import 'package:english_quiz/ui/ErrorPage/check_answers.dart';
import 'package:english_quiz/ui/constants.dart';
import 'package:english_quiz/ui/widget/button_widget.dart';
import 'package:english_quiz/ui/widget/page_route.dart';
import 'package:flutter/material.dart';

class QuizFinishedPage extends StatefulWidget {
  QuizFinishedPage({Key? key, required this.questions, required this.answers})
      : super(key: key);
  final List<Question> questions;
  final Map<int, dynamic> answers;

  @override
  _QuizFinishedPageState createState() => _QuizFinishedPageState();
}

late int correctAnswers;

class _QuizFinishedPageState extends State<QuizFinishedPage> {
  @override
  Widget build(BuildContext context) {
    int correct = 0;
    widget.answers.forEach((index, value) {
      if (widget.questions[index].correctAnswer == value) {
        correct++;
      }
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlueColor,
        centerTitle: true,
        title: const Text(
          'Result',
        ),
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: kBlueColor),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Card(
                color: kRedColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: const Text(
                    "Total Questions",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Text(
                    "${widget.questions.length}",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Card(
                color: kRedColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: const Text(
                    "Score",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Text(
                    "${correct / widget.questions.length * 100}%",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Card(
                color: kRedColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: const Text(
                    "Correct Answers",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Text(
                    "$correct/${widget.questions.length}",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Card(
                color: kRedColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: const Text(
                    "Incorrect Answers",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Text(
                    "${widget.questions.length - correct}/${widget.questions.length}",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ButtonWidget(
                      colour: kRedColor, title: "Go to Home", onPress: home),
                  ButtonWidget(
                    onPress: checkAnswers,
                    title: "Check Answers",
                    colour: kRedColor,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void home() => Navigator.pop(context);
  void checkAnswers() => Navigator.of(context).push(
        BouncyPageRoute(
          widget: CheckAnswersPage(
            questions: widget.questions,
            answers: widget.answers,
          ),
        ),
      );
}
