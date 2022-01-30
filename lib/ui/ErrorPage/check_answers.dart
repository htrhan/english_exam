import 'package:english_quiz/modal/question.dart';
import 'package:english_quiz/ui/constants.dart';
import 'package:english_quiz/ui/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:html_unescape/html_unescape.dart';

class CheckAnswersPage extends StatelessWidget {
  final List<Question> questions;
  final Map<int, dynamic> answers;

  const CheckAnswersPage(
      {Key? key, required this.questions, required this.answers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kBlueColor,
        title: const Text('Check Answers'),
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              decoration: const BoxDecoration(color: kBlueColor),
              height: 200,
            ),
          ),
          ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: questions.length + 1,
            itemBuilder: _buildItem,
          )
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    if (index == questions.length) {
      return ButtonWidget(
        colour: kRedColor,
        title: "Done",
        onPress: () {
          Navigator.of(context)
              .popUntil(ModalRoute.withName(Navigator.defaultRouteName));
        },
      );
    }
    Question question = questions[index];
    bool correct = question.correctAnswer == answers[index];
    return Card(
      color: kBlueColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              HtmlUnescape().convert(question.question),
              style:
                  const TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),
            ),
            const SizedBox(height: 5.0),
            Text(
              HtmlUnescape().convert("${answers[index]}"),
              style: TextStyle(
                  color: correct ? Colors.green : kRedColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5.0),
            correct
                ? Container()
                : Text.rich(
                    TextSpan(children: [
                      const TextSpan(
                        text: "Answer: ",
                        style: TextStyle(color: Colors.green),
                      ),
                      TextSpan(
                          text: HtmlUnescape().convert(question.correctAnswer),
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ))
                    ]),
                    style: const TextStyle(fontSize: 14.0),
                  )
          ],
        ),
      ),
    );
  }
}
