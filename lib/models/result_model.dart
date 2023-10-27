class ResultModel{
  String testName;
  String score;
  String duration;

  ResultModel({required this.testName,required this.score, required this.duration});

  Map<String, dynamic> toJson() {
    return {
      'testName': this.testName,
      'score': this.score,
      'duration': this.duration,
    };
  }

  factory ResultModel.fromJson(Map<String, dynamic> data) {
    return ResultModel(
      testName: data['testName'],
      score: data['score'],
      duration: data['duration'],
    );
  }

}