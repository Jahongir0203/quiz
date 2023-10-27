import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:quiz/pages/history_page.dart';
import 'package:quiz/pages/lesson_page.dart';
import 'package:quiz/pages/settings_page.dart';
import 'package:quiz/utilies/app_png.dart';

import '../widgets/build_main_page_container.dart';
import 'about_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  AudioPlayer player=AudioPlayer();
  String audio='mp/onTap.mp3';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppPng.bcgMain),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 70),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  buildMainCotainer(
                    text: 'Quiz',
                    onTap: () {
                      player.play(AssetSource(audio));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LessonPage(),
                        ),
                      );
                    },
                  ),
                  buildMainCotainer(
                    text: 'Settings',
                    onTap: () {
                      player.play(AssetSource(audio));

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingsPage(),
                        ),
                      );
                    },
                  ),
                  buildMainCotainer(
                    text: 'History',
                    onTap: () {
                      player.play(AssetSource(audio));

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HistoryPage(),
                        ),
                      );
                    },
                  ),
                  buildMainCotainer(
                    text: 'About',
                    onTap: () {
                      player.play(AssetSource(audio));

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
