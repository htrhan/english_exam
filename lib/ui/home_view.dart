import 'package:english_quiz/ui/constants.dart';
import 'package:flutter/material.dart';
import 'grid_view/grid_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, headerisScroll) {
        return [
          SliverAppBar(
            actions: [Switch(value: true, onChanged: (state) {})],
            pinned: true,
            backgroundColor: kBlueColor,
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/appbar.png",
                fit: BoxFit.contain,
              ),
              centerTitle: true,
              title: Text(
                headerisScroll
                    ? "YDS QUİZ"
                    : "Select a category to start the quiz",
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontSize: 12,
                    color: const Color(0xFFF3D5C0),
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ];
      },
      body: const Gridview(),
    );
  }
}
