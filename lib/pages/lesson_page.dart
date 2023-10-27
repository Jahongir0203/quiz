import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:quiz/pages/main_page.dart';
import 'package:quiz/pages/quiz_page.dart';
import 'package:quiz/utilies/app_colors.dart';
import 'package:quiz/utilies/app_png.dart';
import 'package:quiz/utilies/test_utilies.dart';

class LessonPage extends StatefulWidget {
  const LessonPage({Key? key}) : super(key: key);

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  AudioPlayer player1=AudioPlayer();
  String audio1='mp/onTap.mp3';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          AppPng.bcgMain,
          fit: BoxFit.fill,
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40, left: 15),
          child: IconButton(
            onPressed: () {
              player1.play(AssetSource(audio1));
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> const MainPage(),),);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 2 - 150),
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: lessons.length,
                itemBuilder: (buildContext, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 56,
                      right: 39,
                      top: 26,
                    ),
                    child: Container(
                      height: 138,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.mainTextColor.withOpacity(0.25),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: MaterialButton(
                        splashColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        onPressed: () {
                          player1.play(AssetSource(audio1));

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  QuizPage(lessonModel: lessons[index]),
                            ),
                          );
                        },
                        color: Colors.white,
                        child: Center(
                          child: Row(children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 48, top: 24, bottom: 24, right: 20),
                              child: Image.asset(lessons[index].icon),
                            ),
                            Text(
                              lessons[index].name,
                              style: const TextStyle(
                                color: AppColors.mainTextColor,
                                fontSize: 35,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ]),
    );
  }
}
