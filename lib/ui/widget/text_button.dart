import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:english_quiz/modal/categories.dart';
import 'package:english_quiz/ui/widget/quizoption.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatefulWidget {
  const TextButtonWidget(
      {Key? key, required this.category, required this.child})
      : super(key: key);

  final Category category;
  final Widget child;
  @override
  _TextButtonWidgetState createState() => _TextButtonWidgetState();
}

class _TextButtonWidgetState extends State<TextButtonWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.greenAccent),
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        _awesomeDialog(context, widget.category);
      },
      child: widget.child,
    );
  }

  void _awesomeDialog(context, category) {
    // ignore: avoid_single_cascade_in_expression_statements
    AwesomeDialog(
      dialogBackgroundColor: const Color(0xff676FA3),
      context: context,
      animType: AnimType.TOPSLIDE,
      dialogType: DialogType.QUESTION,
      btnOkText: "Start Quiz",
      showCloseIcon: true,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              category.title,
              style: const TextStyle(
                  fontStyle: FontStyle.italic, color: Color(0xffF3D5C0)),
            ),
            const Divider(
              color: Colors.deepOrange,
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
              child: const Center(
                child: QuizOptionView(),
              ),
            ),
          ],
        ),
      ),
      title: 'Burası?',
      desc: 'This is also Ignored',
      btnOkOnPress: () {
        print("hello world");
      },
    )..show();
  }
}
