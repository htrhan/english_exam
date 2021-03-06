import 'package:flutter/material.dart';

//main color
const kRedColor = Color(0xFFFF5959);
const kBlueColor = Color(0xFF676FA3);
const kGrayColor = Color(0xFFC1C1C1);
const kGreenColor = Color(0xFF6AC259);
const kBlackColor = Color(0xFF101010);
const kAnimateColor = Color(0xFF46D9BF);

const kPrimaryGradient = LinearGradient(
  colors: [Color(0xFF1A2A46), Color(0xFF1F1E33)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);
const kGridGradient = LinearGradient(
  begin: Alignment(0.0, -1.8),
  end: Alignment(0.0, 0.6),
  colors: <Color>[Color(0xffef5350), Color(0x00ef5350)],
);
const double kDefaultPadding = 20.0;

const quiztext = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 14,
);
