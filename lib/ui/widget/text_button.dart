import 'package:english_quiz/modal/categories.dart';
import 'package:english_quiz/ui/constants.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatefulWidget {
  const TextButtonWidget({Key? key, required this.category}) : super(key: key);

  final Category category;
  @override
  _TextButtonWidgetState createState() => _TextButtonWidgetState();
}

List number = [10, 20, 30, 40, 50];
int selectedIndex = 0;
Color colour = Colors.deepOrange;
late bool processing;
late int noOfQuestion;

class _TextButtonWidgetState extends State<TextButtonWidget> {
  @override
  void initState() {
    super.initState();
    noOfQuestion = 10;
    processing = false;
  }

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
              index == selectedIndex ? Colors.blueGrey : colour),
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
