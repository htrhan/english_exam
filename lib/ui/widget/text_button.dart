import 'package:english_quiz/modal/categories.dart';
import 'package:english_quiz/ui/widget/quizoption.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatefulWidget {
  const TextButtonWidget({
    Key? key,
    required this.category,
    required this.child,
  }) : super(key: key);

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
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => QuizOptionView(category: widget.category),
        );
      },
      child: Center(child: widget.child),
    );
  }
}
