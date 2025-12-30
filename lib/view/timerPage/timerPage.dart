import 'dart:async';
import 'dart:math';
import 'package:final_project/view/home/messageWidget.dart';
import 'package:final_project/view/timerPage/cancelSessionDialog.dart';
import 'package:final_project/view/timerPage/startBreakDialog.dart';
import 'package:final_project/view/timerPage/startWorkDialog.dart';
import 'package:flutter/material.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import '../../controller/settingsController.dart';
import '../../model/cat.dart';
import '../../model/homeModel.dart';
import '../../model/session.dart';
import '../../model/themeData.dart';
import 'endSessionDialog.dart';
import 'cancelledSession.dart';
import 'timerClock.dart';


class TimerPage extends StatefulWidget {

  TimerPage({super.key, required this.session});

  final Session session;

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage>  with TickerProviderStateMixin {
  late Session session = widget.session;

  //TimerClock clock = new TimerClock();
  //late Widget centerWidget;
  //Timer Stuff
  late AnimationController timeController;
  late Timer? timer;
  late String timerType;
  late bool isWork;
  late int workDuration;
  late int breakDuration;
  late int breakCount;
  late int workCount;
  late int secs = 0;
  late int mins = 0; //displayed
  late int timerDuration = workDuration;

  //Cats Stuff
  List<Cat> _catsOnScreen = Cat.catAcquired;
  List<Map<String, double>> _catPositions = [];
  final Random _random = Random();
  late double catLeft = 0;
  late double catTop = 0;

  //Stops the phone from closing during a work sessison
  void _stopLockFeatures() async {
    if (SettingsController.getLockAcess) {
      WakelockPlus.disable();
    }
  }

  //Starts Timer
  Future<void> startTimer() async {//int mins
    WakelockPlus.enable();
    print(session.timerType);

    //Starts the animations and counting
    //POMODORO TYPE
    if (session.timerType == 'Pomodoro' || (session.timerType == 'Countdown' && !session.isWork)) { //pomodoro or break|| !isWork
      print('${session.timerType}!');
      //mins = timerDuration;
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        print('iswork: ${session.isWork}');
        //this.secs = secs;
        if (secs > 0) {
          setState(() {
            print('$mins : ${this.secs},$secs');
            //Changes Cat positions every 30 seconds
            if (secs%30 == 0) {
              _catPositions = [];
              for (int i = 0; i < _catsOnScreen.length; i++) {
                catLeft = _random.nextInt(400).toDouble();
                catTop = _random.nextInt(900).toDouble();
                _catPositions.add({'left': catLeft, 'top': catTop});
                }
              }
            secs--;
            this.mins = (secs/60).floor();
          });
        }
        else { //no more seconds left = END SESH!
          workDuration = secs;
          timer.cancel();
          endTimer();
        }
      });
    }
    //COUNTDOWN TYPE
    else if (session.timerType == 'Countdown' && session.isWork) {
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        print('iswork: ${session.isWork}');
        //countdown
        if (mins >= 100) { //max 100 hrs
          //END SESH!
          this.workDuration = this.secs;
          this.mins = 0; //restart countdown
          endTimer();
        }
        else {
          //this.secs = secs;
          setState(() {
            secs++;
            this.mins = (secs / 60).floor();
            //cats
            if (secs == 0 || secs % 30 == 0) {
              _catPositions = [];
              for (int i = 0; i < _catsOnScreen.length; i++) {
                catLeft = _random.nextInt(400).toDouble();
                catTop = _random.nextInt(900).toDouble();
                _catPositions.add({'left': catLeft, 'top': catTop});
              }
            }
          });
        }
      });
    }
  }

  //End of Timer
  Future<void> endTimer() async {
    workCount = this.session.workCount;
    breakCount = this.session.breakCount;
    this.mins = 0;
    this.secs = 0;
    if (this.session.isWork && this.session.workCount<4) { //a work session ends
      this.session.startBreak(session.workDuration);
      isWork = session.isWork;
      breakCount = session.breakCount;
      workCount = session.workCount;
      print('++work session ends | ${session.isWork} | ${this.session.breakCount} | ${this.session.workCount}');
      print('$session | ${this.session.totalWorkDuration}');
      mins = 0;
      timeController.stop();
      await showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return StartBreakDialog();
        }
      );
      setState(() {
        timerDuration = this.session.breakDuration;
        mins = timerDuration;
        secs = timerDuration*60;
        print(secs);
        timeController.duration = Duration(minutes: timerDuration);
        timeController.reset();
        timeController.forward();
        startTimer();//breakDuration
      });
    }
    else if (!session.isWork && session.breakCount<2 && session.workCount<3) { //a break session ends
      this.session.startWork(breakDuration);
      isWork = session.isWork;
      breakCount = session.breakCount;
      workCount = session.workCount;
      print('++break session ends | $session.isWork | ${this.session.breakCount} | ${this.session.workCount}');
      print('$session | ${this.session.totalBreakDuration}');
      timeController.stop();
      await showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return StartWorkDialog();
        }
      );
      setState(() {
        timerDuration = this.session.workDuration;
        mins = timerDuration;
        secs = timerDuration*60;
        print(secs);
        timeController.duration = Duration(minutes: timerDuration);
        timeController.reset();
        timeController.forward();
        startTimer();//workDuration
      });
    }
    else  {//if ()workCount > 3 &&//!session.isWork && session.breakCount >= 3 && session.workCount >= 4
      print('++session completely ends | $isWork | ${this.session.breakCount} | ${this.session.workCount}');
      print('$session | ${this.session.totalWorkDuration}');
      _showFinishConfirmationDialog();
    }
  }

  void _showCancelConfirmationDialog() async {
    // Make the function async
    final bool? shouldCancel = await showDialog<bool>( // Await a boolean result
      context: context,
      builder: (BuildContext dialogContext) {
        return CancelSessionDialog(); // Show your updated dialog
      },
    );
    if (shouldCancel == true) {
      print('stop');
      endSession();
      this.session.endSession();
      Navigator.of(context).pop('trueCancel');
    }
  }

  void _showFinishConfirmationDialog() async {
    //HomeModel.earnKibbles(session.totalWorkDuration);
    // Make the function async
    final bool? shouldCancel = await showDialog<bool>( // Await a boolean result
      context: context,
      builder: (BuildContext dialogContext) {
        return EndSessionDialog(); // Show your updated dialog
      },
    );
    if (shouldCancel == true) {
      endSession();
      this.session.endSession();
      Navigator.of(context).pop('trueFinish');
    }
  }

  void endSession() {
    print('end session completely');
    timer?.cancel();
    timer = null;
    if (SettingsController.getLockAcess) {
      _stopLockFeatures();
    }
  }

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < _catsOnScreen.length; i++){
      late double catLeft = _random.nextInt(400).toDouble();
      late double catTop = _random.nextInt(900).toDouble();
      _catPositions.add({'left': catLeft, 'top': catTop});
    }

    timerType = this.session.timerType;
    isWork = this.session.isWork;
    workDuration = this.session.workDuration.round();
    breakDuration = this.session.breakDuration.round();
    breakCount = this.session.breakCount;
    workCount = this.session.workCount;

    if (timerType == 'Pomodoro' || !isWork) {
      mins = workDuration;
      secs = mins*60;
    }
    else {
      mins = 0;
    }

    timeController = AnimationController(
      vsync: this,
      duration: Duration(minutes: timerDuration)
    )..addListener(() {
      setState(() {});
    });
    timeController.forward();
    startTimer(); //?workDuration
  }

  @override
  void dispose() {
    timeController.dispose();
    timer?.cancel();
    WakelockPlus.disable();
    if (SettingsController.getLockAcess) {
      _stopLockFeatures();
    }
    timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10,
          automaticallyImplyLeading: false
      ),
      body: PopScope( // Intercepts the system back button // Only allow back if lock is off
        canPop: !SettingsController.getLockAcess,
        onPopInvoked: (didPop) {
          if (didPop) return;
        },
        child: DecoratedBox(
          //APPEARANCE: Background//
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/backgrounds/default.jpg'), fit: BoxFit.cover
            ),
          ),
          child: Center(
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              padding: EdgeInsets.all(20),
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: .start,
                    crossAxisAlignment: .center,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        height: 35,
                      ),
                      //Message//
                      MessageWidget(),
                      //Session Info: Work Session/Break
                      Container(
                        alignment: .bottomCenter,
                        width: MediaQuery.sizeOf(context).width,
                        height: 55,
                        child: Text(
                          '${isWork ? 'Work Time!' : 'Rest is important!'}',
                          textAlign: .center,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Antipasto',
                            fontWeight: .bold,
                            fontStyle: .italic,
                            color: CatBuddyThemeData.mainColor,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                            applyHeightToFirstAscent: false,
                            applyHeightToLastDescent: false,
                          ),
                        ),
                      ),
                      //Center Area//
                      Stack(
                        alignment: .center,
                        children: <Widget>[
                          ////Clock BG
                          TimerClock(),
                          ////Clock Animation
                          Visibility(
                            visible: timerType == 'Pomodoro' || !isWork,
                            child: Positioned(
                              top: 197.5,
                              left: 156.17,
                              child: Container(
                                width: 390,
                                height: 490,
                                alignment: .topLeft,
                                child: CircularProgressIndicator(
                                  value: timeController.value,
                                  constraints: BoxConstraints(
                                    minWidth: 57,
                                    minHeight: 57,
                                  ),
                                  strokeWidth: 200,
                                  backgroundColor: Color.fromRGBO(0x29, 0x46, 0x8e, 1),
                                  color: Color.fromRGBO(0xec, 0xd5, 0x14, 1),
                                ),
                              ),
                            ),
                          ),
                          ////Time Display
                          Positioned(
                            top: 400,
                            child: Stack(
                              alignment: .topCenter,
                              children: <Widget>[
                                //Time Outline//
                                Positioned(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(0xfa, 0xfc, 0xfb, 1), //0.4//0x29, 0x14, 0x19//0xec, 0xd5, 0x14
                                      borderRadius: BorderRadius.circular(19),
                                    ),
                                    width: 351,
                                    height: 99.5,
                                    margin: EdgeInsets.fromLTRB(9.25, 0.5, 9.25, 0),
                                  ),
                                ),
                                //Actual Time Container//
                                Positioned(
                                  child: Opacity(
                                    opacity: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(0x09, 0x28, 0x75, 1), //0.4
                                        borderRadius: BorderRadius.circular(17),
                                      ),
                                      width: 347.5,
                                      height: 98,
                                      margin: EdgeInsets.symmetric(horizontal: 18.5),
                                      child: Row(
                                        spacing: 15,
                                        mainAxisAlignment: .center,
                                        children: <Widget>[
                                          //Minute 1//
                                          Container(
                                            width: 50.75,
                                            height: 85,
                                            alignment: .center,
                                            child: Text(
                                              '${(mins/10).floor()}',
                                              textAlign: .center,
                                              style: TextStyle(
                                                fontSize: 65,
                                                fontFamily: 'PoiretOne',
                                                fontWeight: .bold,
                                                color: Color.fromRGBO(0xfa, 0xfc, 0xfb, 1),
                                                height: 0.5,
                                              ),
                                              textHeightBehavior: TextHeightBehavior(
                                                applyHeightToFirstAscent: false,
                                                applyHeightToLastDescent: false,
                                              ),
                                            ),
                                          ),
                                          //Minute 2//
                                          Container(
                                            width: 50.75,
                                            height: 85,
                                            alignment: .center,
                                            child: Text(
                                              '${((mins)%10).toInt()}',
                                              textAlign: .center,
                                              style: TextStyle(
                                                fontSize: 65,
                                                fontFamily: 'PoiretOne',
                                                fontWeight: .bold,
                                                color: Color.fromRGBO(0xfa, 0xfc, 0xfb, 1),
                                                height: 0.5,
                                              ),
                                              textHeightBehavior: TextHeightBehavior(
                                                applyHeightToFirstAscent: false,
                                                applyHeightToLastDescent: false,
                                              ),
                                            ),
                                          ),
                                          //Colon//
                                          Container(
                                            width: 30,
                                            height: 85,
                                            alignment: .center,
                                            child: Text(
                                              ':',
                                              textAlign: .center,
                                              style: TextStyle(
                                                fontSize: 50,
                                                color: Color.fromRGBO(0xfa, 0xfc, 0xfb, 1),
                                              ),
                                              textHeightBehavior: TextHeightBehavior(
                                                applyHeightToFirstAscent: false,
                                                applyHeightToLastDescent: false,
                                              ),
                                            ),
                                          ),
                                          //Second 1//
                                          Container(
                                            width: 50.75,
                                            height: 85,
                                            alignment: .center,
                                            child: Text(
                                              '${((secs%60)/10).floor()}',
                                              textAlign: .center,
                                              style: TextStyle(
                                                fontSize: 65,
                                                fontFamily: 'PoiretOne',
                                                fontWeight: .bold,
                                                color: Color.fromRGBO(0xfa, 0xfc, 0xfb, 1),
                                                height: 0.5,
                                              ),
                                              textHeightBehavior: TextHeightBehavior(
                                                applyHeightToFirstAscent: false,
                                                applyHeightToLastDescent: false,
                                              ),
                                            ),
                                          ),
                                          //Second 2//
                                          Container(
                                            width: 50.75,
                                            height: 85,
                                            alignment: .center,
                                            child: Text(
                                              '${((secs%60)%10).toInt()}',
                                              textAlign: .center,
                                              style: TextStyle(
                                                fontSize: 65,
                                                fontFamily: 'PoiretOne',
                                                fontWeight: .bold,
                                                color: Color.fromRGBO(0xfa, 0xfc, 0xfb, 1),
                                                height: 0.5,
                                              ),
                                              textHeightBehavior: TextHeightBehavior(
                                                applyHeightToFirstAscent: false,
                                                applyHeightToLastDescent: false,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //Play Button (stopping countdown)
                          Visibility(
                            visible: timerType == 'Countdown',
                            child: Positioned(
                              top: 190,
                              left: 125,
                              child: Stack(
                                children: <Widget>[
                                  //Outermost Outline (yellow/white)//
                                  Positioned(
                                    top: -0.5,
                                    left: 23.5,
                                    child: Container(
                                      width: 71,
                                      height: 71,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Color.fromRGBO(0xf2, 0xdf, 0x3d, 0.65),//0xfa, 0xfc, 0xfb
                                      ),
                                    ),
                                  ),
                                  //Actual Button//
                                  ElevatedButton(
                                    //Button Outer Circle (red)
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: CatBuddyThemeData.accentColor,
                                      shape: CircleBorder(),
                                    ),
                                    onPressed: () {
                                      //Open Timer Pop-Up
                                      print('stop countdown sesh button works!');
                                      endTimer(); //stop work session
                                    },
                                    child: Stack(
                                      children: <Widget>[
                                        //Play Button Outline (yellow/white)//
                                        Positioned(
                                          top: 5,
                                          left: 5,
                                          child: Container(
                                            width: 60,
                                            height: 60,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50),
                                              color: Color.fromRGBO(0xfa, 0xfc, 0xfb, 0.65),//0xf2, 0xdf, 0x3d//0xfa, 0xfc, 0xfb
                                            ),
                                          ),
                                        ),
                                        //Triangle in the Center (red)//
                                        Positioned(
                                          top: 10,
                                          left: 10,
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50),
                                              color: CatBuddyThemeData.accentColor2,//0xf2, 0xdf, 0x3d//0xc1, 0x18, 0x1d
                                            ),
                                          ),
                                        ),
                                        //Play Button (dark red purple)//
                                        Icon(
                                          Icons.play_circle_rounded,
                                          size: 70,
                                          color: CatBuddyThemeData.minorColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      //Cancel Button//
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(0xd1, 0xc8, 0xa9, 0.9), //color: variable//
                          borderRadius: BorderRadius.circular(50),
                        ),
                        margin: EdgeInsets.only(top: 5),
                        padding: EdgeInsets.only(top: 2),
                        width: 100,
                        height: 35,
                        alignment: .center,
                        child: TextButton(
                          onPressed: () async {
                            print('cancel session button works!');
                            //Open Cancel Session Pop-Up
                            _showCancelConfirmationDialog();
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationThickness: 2,
                              decorationColor: Color.fromRGBO(0x9c, 0x8b, 0x79, 1),
                              fontSize: 20,
                              fontFamily: 'Antipasto',
                              fontWeight: .bold,
                              color: Color.fromRGBO(0x9c, 0x8b, 0x79, 1),
                            ),
                            textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false,
                              applyHeightToLastDescent: false,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //Cats
                  for (int i = 0; i < _catsOnScreen.length; i++)
                    Positioned(
                      top: _catPositions[i]['top']?.toDouble(),
                      left: _catPositions[i]['left']?.toDouble(),
                      child: Image.asset(
                        _catsOnScreen[i].getCatPhoto,
                        width: 60, height: 60, filterQuality: FilterQuality.high,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}