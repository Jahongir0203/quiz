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
  bool isPlaying=true;
  HiveRepository hiveRepository = HiveRepository();
  int currentIndex =1;
@override
  void initState() {
  isPlaying=hiveRepository.getSound();
    super.initState();
  }
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isPlaying=true;
                    });
                    hiveRepository.saveSound(true);
                  },
                  splashColor: Colors.green,
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: isPlaying? Colors.blue : Colors.white,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.music_note,
                        color: isPlaying ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                InkWell(
                  onTap: () {
                    setState(() {
                      isPlaying=false;
                    });
                    hiveRepository.saveSound(false);
                  },
                  splashColor: Colors.green,
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: isPlaying ? Colors.white : Colors.blue,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.music_off,
                        color: isPlaying ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
