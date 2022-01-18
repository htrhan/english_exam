import 'package:english_quiz/ui/constants.dart';
import "package:flutter/material.dart";

class QuizOptionView extends StatefulWidget {
  const QuizOptionView({Key? key}) : super(key: key);

  @override
  _QuizOptionViewState createState() => _QuizOptionViewState();
}

class _QuizOptionViewState extends State<QuizOptionView> {
  List number = [10, 20, 30, 40, 50];
  int selectedIndex = 0;
  int noOfQuestion = 10;
  Color colour = Colors.deepOrange;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: number.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => TextButton(
        onPressed: () {
          setState(() {
            selectedIndex = index;
            noOfQuestion = number[index];
          });
        },
        child: Text(
          "${number[index]}",
          style: const TextStyle(color: Colors.white),
        ),
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size?>(
            Size(MediaQuery.of(context).size.width / 8,
                MediaQuery.of(context).size.height / 18),
          ),
          backgroundColor: MaterialStateProperty.all<Color?>(
              selectedIndex == index ? Colors.blueGrey : colour),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: const BorderSide(color: kGrayColor),
            ),
          ),
        ),
      ),
    );
  }
}
