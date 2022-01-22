class Question {
  late String categoryName;
  late String question;
  late String correctAnswer;
  late List<dynamic> inCorrectAnswers;
  Question(
      {required this.categoryName,
      required this.question,
      required this.correctAnswer,
      required this.inCorrectAnswers});

  Question.fromMap(Map<String, dynamic> data) {
    categoryName = "milyoner";
    question = data["Question"];
    correctAnswer = data["OptionCorrect"];
    inCorrectAnswers = [
      data["Option1"],
      data["Option2"],
      data["Option3"],
      data["Option4"]
    ];
  }
  static List<Question> fromData(List<Map<String, dynamic>> data) {
    print(data);
    return data.map((question) => Question.fromMap(question)).toList();
  }
}
