import 'package:english_quiz/modal/categories.dart';
import 'package:english_quiz/modal/question.dart';
import 'package:english_quiz/ui/QuizPage/quiz_finished_page.dart';
import 'package:english_quiz/ui/constants.dart';
import 'package:english_quiz/ui/widget/button_widget.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  QuizPage({Key? key, required this.questions, required this.category})
      : super(key: key);
  List<Question> questions;
  Category category;
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentIndex = 0;
  final Map<int, dynamic> _answers = {};
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Question question = widget.questions[_currentIndex];
    final List<dynamic> options = question.inCorrectAnswers;
    if (!options.contains(question.correctAnswer)) {
      options.add(question.correctAnswer);
      options.shuffle();
    }
    return WillPopScope(
      onWillPop: () async {
        bool? result = await _onWillPop();
        result ??= false;
        return result;
      },
      child: Scaffold(
        key: _key,
        body: Container(
          color: kBlueColor,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 5),
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                      color: kRedColor,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        width: 1,
                        color: kGrayColor,
                      )),
                  child: Text(
                    "${_currentIndex + 1}/${widget.questions.length}",
                    style: TextStyle(
                      fontSize:
                          MediaQuery.of(context).size.width > 800 ? 30.0 : 18.0,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(
                        top: 10, right: 6, left: 6, bottom: 16),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: kRedColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(widget.questions[_currentIndex].question),
                  ),
                  const SizedBox(height: 20.0),
                  Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ...options.map(
                          (option) => RadioListTile<dynamic>(
                            dense: true,
                            activeColor: _answers[_currentIndex] == option
                                ? kBlueColor
                                : kRedColor,
                            tileColor: _answers[_currentIndex] == option
                                ? kRedColor
                                : kBlueColor,
                            title: Text(
                              "$option",
                              style: MediaQuery.of(context).size.width > 800
                                  ? const TextStyle(
                                      fontSize: 30.0, color: Colors.white)
                                  : const TextStyle(color: Colors.white),
                            ),
                            groupValue: _answers[_currentIndex],
                            value: option,
                            onChanged: (value) {
                              setState(() {
                                _answers[_currentIndex] = option;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: ButtonWidget(
                        colour: kRedColor,
                        title: _currentIndex == (widget.questions.length - 1)
                            ? "Submit"
                            : "Next",
                        onPress: _nextSubmit),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _nextSubmit() {
    if (_answers[_currentIndex] == null) {
      _key.currentState?.showSnackBar(const SnackBar(
        content: Text("You must select an answer to continue."),
      ));
      return;
    }
    if (_currentIndex < (widget.questions.length - 1)) {
      setState(() {
        _currentIndex++;
      });
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) =>
              QuizFinishedPage(questions: widget.questions, answers: _answers),
        ),
      );
    }
  }

  Future<bool?> _onWillPop() async {
    return showDialog<bool?>(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: const Text(
                "Are you sure you want to quit the quiz? All your progress will be lost."),
            title: const Text("Warning!"),
            actions: <Widget>[
              TextButton(
                child: const Text("Yes"),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
              TextButton(
                child: const Text("No"),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
            ],
          );
        });
  }
}
