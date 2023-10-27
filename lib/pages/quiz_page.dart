import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:quiz/models/result_model.dart';
import 'package:quiz/models/test_model.dart';
import 'package:quiz/pages/lesson_page.dart';
import 'package:quiz/pages/result_page.dart';
import 'package:quiz/repository/hive_repository.dart';
import 'package:quiz/utilies/app_colors.dart';

import '../widgets/build_answers_button.dart';

class QuizPage extends StatefulWidget {
  QuizPage({Key? key, required this.lessonModel}) : super(key: key);
  final LessonModel lessonModel;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  HiveRepository hiveRepository=HiveRepository();
  AudioPlayer player=AudioPlayer();
  AudioPlayer player1=AudioPlayer();
  String audio='mp/mp.mp3';
  String audio1='mp/onTap.mp3';
  String audio2='mp/key.mp3';

  @override
  void initState() {
    bool isPlaying=hiveRepository.getSound();

    if(isPlaying==true){
  player.play(AssetSource(audio));
}else{
  player.pause();
}
    Timer.periodic(Duration(seconds: 1), (timer) {
      return countTimer();
    });
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  int time = 0;
  int x = 0;

  void countTimer() {
    setState(() {
      time++;
      x = time;
    });
  }

  int currentIndex = 0;
  late TestModel currentTest;
  String selectedAns = '';
  int score = 0;

  @override
  Widget build(BuildContext context) {
    currentTest = widget.lessonModel.test[currentIndex];
    HiveRepository hiveRepository = HiveRepository();

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            widget.lessonModel.image,
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 30,
                left: 15,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      player1.play(AssetSource(audio1));
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20,),
                              child: Container(
                                height:150,
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                   const Expanded(
                                        child: Text(
                                      'Attention',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                    )),
                                    const Expanded(
                                        child: Text(
                                      'Are you sure want to exit? ',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w500),
                                    )),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              player1.play(AssetSource(audio2));
                                              Navigator.pop(context);
                                            },
                                            child: Text('No'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              player.pause();
                                              player1.play(AssetSource(audio2));

                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const LessonPage(),
                                                ),
                                              );
                                            },
                                            child: Text('Yes'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Icon(Icons.timer, color: Colors.black, size: 30),
                  Text(
                    (x ~/ 60).toString().padLeft(2, '0') +
                        ':' +
                        (x % 60).toString().padLeft(2, '0'),
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
                padding: const EdgeInsets.only(left: 48, right: 48, top: 265),
                child: Column(
                  children: [
                    Container(
                      height: 138,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 60,
                          right: 80,
                          top: 45,
                          bottom: 45,
                        ),
                        child: Text(
                          currentTest.question,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AppColors.mainTextColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    buildKeyButton(
                      text1: 'A',
                      answers: currentTest.answerA,
                      onTap: () {
                        player1.play(AssetSource(audio2));

                        setState(() {
                          selectedAns = currentTest.answerA;
                        });
                      },
                      onSellected: selectedAns == currentTest.answerA,
                    ),
                    buildKeyButton(
                      text1: 'B',
                      answers: currentTest.answerB,
                      onTap: () {
                        player1.play(AssetSource(audio2));

                      setState(() {
                          selectedAns = currentTest.answerB;
                        });
                      },
                      onSellected: selectedAns == currentTest.answerB,
                    ),
                    buildKeyButton(
                      text1: 'C',
                      answers: currentTest.answerC,
                      onTap: () {
                        player1.play(AssetSource(audio2));

                        setState(() {
                          selectedAns = currentTest.answerC;
                        });
                      },
                      onSellected: selectedAns == currentTest.answerC,
                    ),
                    buildKeyButton(
                      text1: 'D',
                      answers: currentTest.answerD,
                      onTap: () {
                        player1.play(AssetSource(audio2));

                        setState(() {
                          selectedAns = currentTest.answerD;
                        });
                      },
                      onSellected: selectedAns == currentTest.answerD,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 48,
                        bottom: 48,
                        left: 90,
                        right: 90,
                      ),
                      child: Container(
                        height: 64,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.mainTextColor.withOpacity(0.25),
                              spreadRadius: 4,
                              blurRadius: 13,
                              offset: const Offset(0, 2),
                            ),
                          ],
                          color: AppColors.mainTextColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: MaterialButton(
                          splashColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          onPressed: () {
                            player1.play(AssetSource(audio1));

                            if (currentTest.correctAnswer == selectedAns) {
                              score++;
                            }
                            setState(() {
                              if (selectedAns.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    duration: Duration(milliseconds: 300),
                                    content: Text("Please select a button!"),
                                  ),
                                );
                                return;
                              }

                              if (currentIndex ==
                                  widget.lessonModel.test.length - 1) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ResultPage(
                                              testName: widget.lessonModel.name,
                                              result: score,
                                              numOfAns: widget
                                                  .lessonModel.test.length,
                                              min: (x ~/ 60)
                                                  .toString()
                                                  .padLeft(2, '0'),
                                              sec: (x % 60)
                                                  .toString()
                                                  .padLeft(2, '0'),
                                            )));
                              } else {
                                currentIndex++;
                                selectedAns = '';
                              }
                            });

                            print(widget.lessonModel.name);
                            ResultModel resultModel = ResultModel(
                              testName: widget.lessonModel.name,
                              score:
                                  '${score}/${widget.lessonModel.test.length}',
                              duration: (x ~/ 60).toString().padLeft(2, '0') +
                                  ':' +
                                  (x % 60).toString().padLeft(2, '0'),
                            );
                            print('${score}/${widget.lessonModel.test.length}');
                            print(resultModel);
                            print(resultModel.toJson());

                            print('Jahongir');

                            // hiveRepository.saveResult(
                            //     <Map<String, dynamic>>[resultModel.toJson()]);
                            // print(hiveRepository.saveResult(
                            //     <Map<String, dynamic>>[resultModel.toJson()]));
                          },
                          child: Center(
                            child: Text(
                              (currentIndex ==
                                      widget.lessonModel.test.length - 1)
                                  ? 'Finish'
                                  : 'Next',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
