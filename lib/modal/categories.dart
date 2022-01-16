import 'package:flutter/material.dart';

class Category {
  final int id;
  final String title;
  final IconData icon;
  final String images;

  Category(
      {required this.id,
      required this.title,
      required this.icon,
      required this.images});
}

// list of Item
// for our demo
List<Category> categories = [
  Category(
      id: 1,
      title: "Fill in the Blanks",
      icon: Icons.access_alarm,
      images: "https://source.unsplash.com/user/erondu"),
  Category(
      id: 2,
      title: "Sentence Completion",
      icon: Icons.access_alarm,
      images: "https://source.unsplash.com/user/erondu"),
  Category(
      id: 3,
      title: "Translation (EN-TR)",
      icon: Icons.access_alarm,
      images: "https://source.unsplash.com/user/erondu"),
  Category(
      id: 4,
      title: "Paragraph completion",
      icon: Icons.access_alarm,
      images: "https://source.unsplash.com/user/erondu"),
  Category(
      id: 5,
      title: "What would you say",
      icon: Icons.access_alarm,
      images: "https://source.unsplash.com/user/erondu"),
  Category(
      id: 6,
      title: "Find the irrelevant sentence",
      icon: Icons.access_alarm,
      images: "https://source.unsplash.com/user/erondu"),
  Category(
      id: 7,
      title: "Paraphrasing/Restatement",
      icon: Icons.access_alarm,
      images: "https://source.unsplash.com/user/erondu"),
  Category(
      id: 8,
      title: "Diaogue completion",
      icon: Icons.access_alarm,
      images: "https://source.unsplash.com/user/erondu"),
];
