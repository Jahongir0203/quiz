class LessonModel {
  String image;
  String icon;
  String name;
  List<TestModel> test;

  LessonModel({required this.icon, required this.name, required this.test,required this.image});
}



class TestModel {
  String question;
  String answerA;
  String answerB;
  String answerC;
  String answerD;
  String correctAnswer;

  TestModel({
    required this.question,
    required this.answerA,
    required this.answerB,
    required this.answerC,
    required this.answerD,
    required this.correctAnswer,
  });
}
