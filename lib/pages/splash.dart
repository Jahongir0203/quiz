import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:quiz/pages/main_page.dart';
import 'package:quiz/repository/hive_repository.dart';
import 'package:quiz/utilies/app_png.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
HiveRepository hiveRepository=HiveRepository();

  @override
  void initState() {


    Future.delayed(const Duration(seconds:3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainPage(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppPng.bcgSplash,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          const Center(
            child: Text(
              'QuizApp',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: LoadingAnimationWidget.stretchedDots(
                color: Colors.white,
                size:50,
              ),
            ),
          )
        ],
      ),
    );
  }
}
