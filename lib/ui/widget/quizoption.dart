import 'package:english_quiz/modal/categories.dart';
import 'package:english_quiz/ui/constants.dart';
import "package:flutter/material.dart";
import 'package:animated_text_kit/animated_text_kit.dart';

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
  bool isHover = false;
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
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontStyle: FontStyle.italic),
              ),
              const Divider(
                color: kRedColor,
                endIndent: 50,
                indent: 50,
              ),
              Text(
                'Select Total Number of Questions',
                style: Theme.of(context).textTheme.bodyText2,
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
                  elevation: MaterialStateProperty.all<double?>(
                    10.0,
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Start Quiz",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 16,
          right: 16,
          child: CircleAvatar(
            backgroundColor: kBlueColor,
            radius: 50,
            child: DefaultTextStyle(
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 35, fontFamily: "Canterbury"),
              child: AnimatedTextKit(animatedTexts: [
                ScaleAnimatedText('Think'),
                ScaleAnimatedText("?"),
              ]),
            ),
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
            style: Theme.of(context).textTheme.bodyText2,
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
