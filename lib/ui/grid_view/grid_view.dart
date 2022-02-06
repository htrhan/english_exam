import 'package:english_quiz/modal/categories.dart';
import 'package:english_quiz/ui/constants.dart';
import 'package:english_quiz/ui/widget/glassmorphic_widget.dart';
import 'package:english_quiz/ui/widget/text_button.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class Gridview extends StatefulWidget {
  const Gridview({Key? key}) : super(key: key);

  @override
  _GridviewState createState() => _GridviewState();
}

class _GridviewState extends State<Gridview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlueColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverGrid.count(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
            children: categories
                .map(
                  (item) => TextButtonWidget(
                    category: item,
                    child: FrostedGlassBox(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.width / 3,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              item.icon,
                              color: kRedColor,
                              size: 36,
                            ),
                            const Divider(
                              color: kRedColor,
                              endIndent: 40,
                              indent: 40,
                            ),
                            Text(
                              item.title,
                              style: ThemeData().textTheme.headline1?.copyWith(
                                  color: const Color(0xFFF3D5C0),
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
