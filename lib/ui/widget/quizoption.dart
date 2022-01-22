import 'package:english_quiz/modal/categories.dart';
import 'package:english_quiz/ui/constants.dart';
import "package:flutter/material.dart";

class QuizOptionView extends StatefulWidget {
  QuizOptionView({Key? key, required this.category}) : super(key: key);
  Category category;

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
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding:
              const EdgeInsets.only(top: 100, bottom: 16, left: 16, right: 16),
          margin: const EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            color: kBlueColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(17),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.category.title,
                style: const TextStyle(
                    fontStyle: FontStyle.italic, color: Color(0xffF3D5C0)),
              ),
              const Divider(
                color: kRedColor,
                endIndent: 50,
                indent: 50,
              ),
              const Text(
                'Select Total Number of Questions',
                style: TextStyle(
                    fontStyle: FontStyle.italic, color: Color(0xffF3D5C0)),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: MediaQuery.of(context).size.height / 18,
                child: Center(
                  child: listView,
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color?>(kRedColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: const BorderSide(color: kGrayColor),
                    ),
                  ),
                ),
                onPressed: null,
                child: const Text("Start Quiz"),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget get listView => ListView.builder(
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
                selectedIndex == index ? kBlueColor : kRedColor),
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
