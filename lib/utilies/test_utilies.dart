import 'package:quiz/utilies/app_bg.dart';
import 'package:quiz/utilies/app_ic.dart';
import 'package:quiz/utilies/app_png.dart';

import '../models/test_model.dart';

List<LessonModel> lessons = [
  LessonModel(
      icon: AppIc.icCpp, name: 'C++', test: cppQuestions, image: AppBg.bgCpp),
  LessonModel(
      icon: AppIc.icJava,
      name: 'Java',
      test: javaQuestions,
      image: AppBg.bgJava),
  LessonModel(
      icon: AppIc.icPython,
      name: 'Python',
      test: pythonQuestions,
      image: AppBg.bgPython),
  LessonModel(
      icon: AppBg.bgMath,
      name: 'Math',
      test: mathQuestions,
      image: AppPng.bcgMain),
  LessonModel(
      icon: AppBg.bgHis,
      name: 'History',
      test: historyQuestions,
      image: AppPng.bcgMain),
];
List<TestModel> mathQuestions = [
  TestModel(
      question: 'Sonlarni yozishda nechta raqam ishlatiladi.',
      answerA: '5',
      answerB: '9',
      answerC: '10',
      answerD: '20',
      correctAnswer: '10'),
  TestModel(
      question: 'Natural sonlar qatoriga eng kichik natural son qaysi.',
      answerA: '1',
      answerB: '0',
      answerC: '2',
      answerD: '4',
      correctAnswer: '1'),
  TestModel(
      question: 'Uchburchakning nechta tomoni bor.',
      answerA: '1',
      answerB: '3',
      answerC: '2',
      answerD: '4',
      correctAnswer: '3'),
  TestModel(
      question: 'Bir santimetr necha milimetrga teng.',
      answerA: '10',
      answerB: '100',
      answerC: '1000',
      answerD: '1',
      correctAnswer: '10'),
  TestModel(
      question:
          'sonlar nurida 23,24,19va 35 sonlardsan qaysi biri eng chapda joylashqgan.',
      answerA: '23',
      answerB: '24',
      answerC: '35',
      answerD: '19',
      correctAnswer: '19'),
  TestModel(
      question: 'Qo’shish amali natijasi nima deyiladi.',
      answerA: "Yig'indi",
      answerB: 'Ko’paytma',
      answerC: 'Ayirma',
      answerD: "bo'luvchi",
      correctAnswer: "Yig'indi"),
];

List<TestModel> historyQuestions = [
  TestModel(
      question: 'Yangi  tarix  necha  davrga  bo`lingan?',
      answerA: '2',
      answerB: '3',
      answerC: '4',
      answerD: '5',
      correctAnswer: '2'),
  TestModel(
      question: 'Fransus  monarxiyasi”haqida  qaysi  olim  yozgan?',
      answerA: 'F.SHiller',
      answerB: 'Fransua  de',
      answerC: 'G.Leoning',
      answerD: 'A.Temur',
      correctAnswer: 'Fransua  de'),
  TestModel(
      question:
          'Nechanchi  asrda  artilleriya  sohasida  muhum  ixtirolar  amalga  oshirildi?',
      answerA: '17',
      answerB: '18',
      answerC: '19',
      answerD: '20',
      correctAnswer: '17'),
  TestModel(
      question: 'Astrolobiya  qaysi  so`zdan  olingan?',
      answerA: 'Arabcha',
      answerB: 'Lotincha',
      answerC: 'Ruscha',
      answerD: 'Yunon',
      correctAnswer: 'Yunon'),
  TestModel(
      question: 'Kolumb  Amerikaga  necha  marta  ekspeditsiya  uyushtirgan?',
      answerA: '4',
      answerB: '6',
      answerC: '2',
      answerD: '3',
      correctAnswer: '6'),
  TestModel(
      question:
          'Yevropa    aholisi   1650-yilda  necha  mln   kishini  tashkil  etdi?',
      answerA: '10mln',
      answerB: '50mln',
      answerC: '100mln',
      answerD: '40mln',
      correctAnswer: '10mln'),
];

List<TestModel> cppQuestions = [
  TestModel(
    question: 'What does the ++ mean in C++?',
    answerA: 'Increase',
    answerB: 'Compile',
    answerC: 'Coded',
    answerD: 'Controller',
    correctAnswer: 'Increase',
  ),
  TestModel(
    question: 'Who developed C++?',
    answerA: 'Dennis Richie',
    answerB: 'James Gosling',
    answerC: 'Steve Jobs',
    answerD: 'Bjarne Stroustrup',
    correctAnswer: 'Bjarne Stroustrup',
  ),
  TestModel(
    question: 'What does STL stand for in C++?',
    answerA: 'Standard Template Library',
    answerB: 'System Transaction List',
    answerC: 'System Template Library',
    answerD: 'Stack Transactional List',
    correctAnswer: 'Standard Template Library',
  ),
  TestModel(
    question: 'What is the full form of OOP?',
    answerA: 'Object Oriented Protocol',
    answerB: 'Object Oriented Procedure',
    answerC: 'Object Oriented Programming',
    answerD: 'Object Oriented Product',
    correctAnswer: 'Object Oriented Programming',
  ),
  TestModel(
    question: 'How to output "Hello World" in C++?',
    answerA: 'printf("Hello World");',
    answerB: 'print("Hello World");',
    answerC: 'std::cout << "Hello World";',
    answerD: 'println("Hello World");',
    correctAnswer: 'std::cout << "Hello World";',
  ),
];

List<TestModel> javaQuestions = [
  TestModel(
    question: 'What do we use to define a block of code in Java?',
    answerA: 'Curly Braces {}',
    answerB: 'Square Brackets []',
    answerC: 'Angle Brackets <>',
    answerD: 'Round Brackets ()',
    correctAnswer: 'Curly Braces {}',
  ),
  TestModel(
    question: 'Who developed Java?',
    answerA: 'Oracle Corporation',
    answerB: 'Microsoft Corporation',
    answerC: 'Sun Microsystems',
    answerD: 'Apple Inc.',
    correctAnswer: 'Sun Microsystems',
  ),
  TestModel(
    question: 'What is the size of a int data type in Java?',
    answerA: '8 bit',
    answerB: '16 bit',
    answerC: '32 bit',
    answerD: '64 bit',
    correctAnswer: '32 bit',
  ),
  TestModel(
    question: 'Java programs are',
    answerA: 'Interpreted only',
    answerB: 'Compiled only',
    answerC: 'Either compiled or interpreted',
    answerD: 'Neither compiled nor interpreted',
    correctAnswer: 'Either compiled or interpreted',
  ),
  TestModel(
    question: 'Which method must be implemented by all threads?',
    answerA: 'wait()',
    answerB: 'start()',
    answerC: 'stop()',
    answerD: 'run()',
    correctAnswer: 'run()',
  ),
];

List<TestModel> pythonQuestions = [
  TestModel(
    question: 'What is the correct file extension for Python files?',
    answerA: '.py',
    answerB: '.pyth',
    answerC: '.pt',
    answerD: '.p',
    correctAnswer: '.py',
  ),
  TestModel(
    question: 'Who developed Python?',
    answerA: 'Guido van Rossum',
    answerB: 'Dennis Ritchie',
    answerC: 'James Gosling',
    answerD: 'Linus Torvalds',
    correctAnswer: 'Guido van Rossum',
  ),
  TestModel(
    question: 'Python is an example of which type of programming languages?',
    answerA: 'Object oriented programming language',
    answerB: 'Procedural oriented programming language',
    answerC: 'Structured programming language',
    answerD: 'All of these',
    correctAnswer: 'All of these',
  ),
  TestModel(
    question: 'What does the len() function do in Python?',
    answerA: 'It counts the length of a List',
    answerB: 'It counts the characters in a String',
    answerC: 'Both A and B',
    answerD: 'None of the above',
    correctAnswer: 'Both A and B',
  ),
  TestModel(
    question: 'What is used to define a block of code in Python language?',
    answerA: 'Curly braces',
    answerB: 'Parenthesis',
    answerC: 'Indentation',
    answerD: 'Quotation',
    correctAnswer: 'Indentation',
  ),
];
