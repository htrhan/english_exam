import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

import 'grid_view/grid_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar,
      extendBodyBehindAppBar: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: Image.asset("assets/images/bg.png").image,
              fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Select a category to start the quiz",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontSize: 18,
                      color: const Color(0xFFF3D5C0),
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.left,
                ),
              ),
              const Gridview(),
            ],
          ),
        ),
      ),
    );
  }
}

PreferredSizeWidget get _appbar => AppBar(
      title: const Text(
        "YDS QUİZ",
        style: TextStyle(color: Color(0xFFF3D5C0)),
      ),
      centerTitle: true,
      elevation: 0,
    );
