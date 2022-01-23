import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  ErrorPage({Key? key, required this.message}) : super(key: key);
  String message;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/bg.png",
            fit: BoxFit.fill,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "assets/images/image1.png",
                fit: BoxFit.fill,
              ),
              Text(message),
              const TextButton(
                onPressed: null,
                child: Text("Retry"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
