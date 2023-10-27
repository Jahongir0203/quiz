import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:quiz/repository/hive_repository.dart';

import '../utilies/app_colors.dart';
import '../utilies/app_png.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isPlaying = true;
  HiveRepository hiveRepository = HiveRepository();
  AudioPlayer player1 = AudioPlayer();
  String audio = 'mp/key.mp3';
int isSellected=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            AppPng.bcgSplash,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {

                    setState(() {
                      isSellected==0;
                      hiveRepository.saveSound(true);
                    });
                  },
                  icon: Icon(Icons.music_note,color: isSellected==0 ?Colors.blue : Colors.grey,),
                ),
                IconButton(onPressed: () {
                 setState(() {
                   isSellected=1;
                   hiveRepository.saveSound(false);
                 });
                }, icon: Icon(Icons.music_off,color: isSellected==1?Colors.blue :Colors.grey,)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
