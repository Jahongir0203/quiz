import 'package:hive/hive.dart';

class HiveRepository {
  Box _box = Hive.box('Result');

 savecurrentTime(List<String> currentTime){
  _box.put('currentTime',currentTime);
}
  saveSound(bool onTap){
    _box.put('onTap', onTap);
  }

  saveTestName(List<String> name) {
    _box.put('name', name);
  }

  saveScore(List<String> score) {
    _box.put('score', score);
  }

  saveTime(List<String> time) {
    _box.put('time', time);
  }

  List<String> getTestName() {
    return _box.get('name', defaultValue: <String>[]);
  }

  List<String> getScore() {
    return _box.get('score', defaultValue: <String>[]);
  }

  List<String> getTime() {
    return _box.get('time', defaultValue: <String>[]);
  }

  bool getSound(){
    return _box.get('onTap',defaultValue:true);
  }
List<String> getCurrentTime(){
 return _box.get('currentTime',defaultValue: <String>[]);
}
// saveResult(List<Map<String, dynamic>> results) {
//   _box.put('results', results);
// }
//
// getResult() {
//   _box.get('results', defaultValue: <Map<String, dynamic>>[]);
// }
}
