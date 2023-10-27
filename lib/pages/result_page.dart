import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quiz/pages/main_page.dart';
import 'package:quiz/repository/hive_repository.dart';
import 'package:quiz/utilies/app_bg.dart';
import 'package:quiz/utilies/app_ic.dart';

class ResultPage extends StatefulWidget {
  ResultPage(
      {Key? key,
      required this.result,
      required this.numOfAns,
      required this.min,
      required this.sec,
      required this.testName})
      : super(key: key);
  int result;
  int numOfAns;
  String min;
  String sec;
  String testName;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  HiveRepository hiveRepository = HiveRepository();
  AudioPlayer player=AudioPlayer();
  String audio1='mp/finish.wav';
  String audio='mp/onTap.mp3';

  @override
  void initState() {
    player.play(AssetSource(audio1));
    List<String> names = [];
    List<String> scores = [];
    List<String> time = [];
    List <String> currentTime=[];
    String tdata = DateFormat("HH:mm dd-MM-yyyy").format(DateTime.now());
    currentTime.add(tdata);
    hiveRepository.savecurrentTime(currentTime..addAll(hiveRepository.getCurrentTime()));



    (names..addAll(hiveRepository.getTestName())).add(widget.testName);
    (scores..addAll(hiveRepository.getScore()))
        .add('${widget.result}/${widget.numOfAns}');
    (time..addAll(hiveRepository.getTime())).add('${widget.min}:${widget.sec}');

    hiveRepository.saveTestName(names);
    hiveRepository.saveScore(scores);
    hiveRepository.saveTime(time);

    // hiveRepository
    //     .saveTestName([widget.testName]..addAll(hiveRepository.getTestName()));
    //
    // hiveRepository.saveScore(['${widget.result}/${widget.numOfAns}']
    //   ..addAll(hiveRepository.getScore()));
    // hiveRepository.saveTime(
    //     ['${widget.min}:${widget.sec}']..addAll(hiveRepository.getTime()));
     print("${hiveRepository.getTestName()}");
    print("${hiveRepository.getScore()}");
print("${hiveRepository.getCurrentTime()}");


    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    double a = (widget.result / widget.numOfAns);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppBg.bgResult,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Completed",
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "${(widget.result)}/${(widget.numOfAns)}",
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '${((widget.result / widget.numOfAns).toDouble() * 100)}%',
                  style: TextStyle(
                    fontSize: 30,
                    color: a >= 50 ? Colors.white : Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Duration=>${widget.min}:${widget.sec}",
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    player.play(AssetSource(audio));
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> const MainPage(),),);
                  },
                  splashColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    height: 40,
                    width:150,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "Go home",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(AppIc.icResult),
          ),
        ],
      ),
    );
  }
}
