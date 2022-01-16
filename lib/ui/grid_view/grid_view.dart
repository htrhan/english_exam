import 'package:english_quiz/modal/categories.dart';
import 'package:english_quiz/ui/constants.dart';
import 'package:english_quiz/ui/widget/text_button.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Gridview extends StatefulWidget {
  const Gridview({Key? key}) : super(key: key);

  @override
  _GridviewState createState() => _GridviewState();
}

class _GridviewState extends State<Gridview> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        padding: const EdgeInsets.only(left: 10, right: 10),
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: categories
            .map((item) => Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: kGridGradient,
                      borderRadius: BorderRadius.circular(20),
                      /* image: DecorationImage(
                        image: NetworkImage(item.images), fit: BoxFit.cover),*/
                    ),
                    child: InkWell(
                      overlayColor:
                          MaterialStateProperty.all(Colors.greenAccent),
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        _awesomeDialog(context, item);
                      },
                      child: _glassmorphicWidget(item.icon, item.title),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }

  _glassmorphicWidget(
    IconData icon,
    String title,
  ) =>
      GlassmorphicContainer(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        borderRadius: 10,
        linearGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFFFFAFAF).withAlpha(55),
              const Color(0xFFffffff).withAlpha(45),
            ],
            stops: const [
              0.3,
              0.8,
            ]),
        border: 0,
        blur: 1,
        borderGradient: kPrimaryGradient,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: kDefaultPadding,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(
                      width: 1,
                    ),
                    Icon(icon),
                  ],
                ),
              ),
              const Spacer(),
              Text(
                title,
                style: ThemeData().textTheme.headline1?.copyWith(
                    color: const Color(0xFFF3D5C0),
                    fontWeight: FontWeight.w300,
                    fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
            ],
          ),
        ),
      );

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
              child: Center(
                child: TextButtonWidget(
                  category: category,
                ),
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
