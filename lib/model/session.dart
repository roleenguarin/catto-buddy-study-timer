import 'package:final_project/model/homeModel.dart';
import '../view/home/centerWidget/lists/Categories/CategoryListBlock.dart';
import '../view/home/centerWidget/lists/Types/typeListBlock.dart';


class Session {
  Session(int this.workDuration, int this.breakDuration, {required String this.timerType, required Types? this.sessionType, required Categories? this.category, required DateTime this.timeStarted});

  String timerType;
  Types? sessionType;
  Categories? category;
  DateTime timeStarted;
  late DateTime timeEnded;
  int workDuration;
  int breakDuration;
  int workCount = 0;
  int breakCount = 0;
  bool isWork = true;

  late int totalWorkDuration = 0;
  late int totalBreakDuration = 0;

  void endSession() {
    //earn kibbles ! //parang dapat sa home model to
    HomeModel.earnKibbles(totalWorkDuration);
    print('$totalWorkDuration | ${(HomeModel.earnedKibbles)}');
  }

  void startWork(int breakDuration) {
    this.isWork = true;
    this.breakCount++;//=2+
    this.totalBreakDuration += breakDuration; //add the finished work minutes
    print('+++startWork');
  }
  void startBreak(int workDuration) {
    this.isWork = false;
    this.workCount++;//+=2
    this.totalWorkDuration += workDuration; //add the finished work mins
    print('+++startBreak');
  }

  int get getWorkCount => workCount;
  int get getBreakCount => breakCount;

}