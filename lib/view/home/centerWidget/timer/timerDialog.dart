import 'package:final_project/view/home/centerWidget/lists/Categories/CategoryListBlock.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../model/session.dart';
import '../../../timerPage/cancelledSession.dart';
import '../../../timerPage/endSessionDialog.dart';
import '../../../timerPage/timerPage.dart';
import '../lists/Types/typeListBlock.dart';


class TimerDialog extends StatefulWidget {

  TimerDialog({required this.pageContext});

  final BuildContext pageContext;

  @override
  State<StatefulWidget> createState() => _TimerDialogState(pageContext: pageContext);
}
class _TimerDialogState extends State<TimerDialog> {

  _TimerDialogState({required this.pageContext});

  final BuildContext pageContext;

  List<bool> categoryType = [true, false]; //should be dependent on list.length
  List<bool> timerType = [true, false]; //should be dependent on list.length
  List<bool> pomodoroType = [true, false, false];
  late int workMins = 30;
  late int breakMins = 5;
  late Types? selectedType;
  late Categories? selectedCategory;
  late String selectedTimer;

  @override
  void initState() {
    super.initState();
    if (Types.TypeList.isNotEmpty) {
      selectedType = Types.TypeList[0];
    }
    if (Categories.CategoryList.isNotEmpty) {
      selectedCategory = Categories.CategoryList[0];
    }
  }

  @override
  Widget build(BuildContext timerDialogContext) {
    return AlertDialog(
      backgroundColor: Color.fromRGBO(0xd1, 0xc8, 0xa9, 1),
      title: Row(
        children: <Widget>[
          Spacer(),
          SizedBox(
            height: 26,
            child: IconButton(
              onPressed: () {
                print('close button works!');
                //Close confirmation Pop-Up
                Navigator.pop(timerDialogContext);
              },
              icon: Icon(Icons.close_rounded, size: 26, weight: 50, color: Color.fromRGBO(0x29, 0x14, 0x19, 1),),
            ),
          ),
        ],
      ),
      content: Container(
        width: 330,
        height: 500,
        child: Column(
          //spacing: 10,
          children: <Widget>[
            //Timer Type Select Buttons//
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                color: Color.fromRGBO(0x29, 0x46, 0x8e, 1),
              ),
              width: 283,
              margin: EdgeInsets.only(bottom: 10),
              alignment: .center,
              child: ToggleButtons(
                isSelected: timerType,
                onPressed: (int index) {
                  setState(() {
                    timerType[0] = !timerType[0];
                    timerType[1] = !timerType[1];
                    // FIX: Update selectedTimer when the button is pressed
                    selectedTimer = timerType[0] ? 'Pomodoro' : 'Countdown';
                    print(timerType);
                  });
                },
                borderRadius: BorderRadius.circular(16),
                selectedColor: Color.fromRGBO(0x29, 0x46, 0x8e, 1),
                fillColor: Color.fromRGBO(0xec, 0xd5, 0x14, 1),
                color: Color.fromRGBO(0xd1, 0xc8, 0xa9, 1),
                //splashColor: Color.fromRGBO(0x29, 0x46, 0x8e, 1),
                children: <Widget>[
                  Container(
                    //color: Color.fromRGBO(0x29, 0x46, 0x8e, 1),
                    width: 140,
                    alignment: .center,
                    child: Text(
                      'Pomodoro',
                      style: TextStyle(
                        fontSize: 21,
                        fontFamily: 'Antipasto',
                        fontWeight: .w600,
                      ),
                      textHeightBehavior: TextHeightBehavior(
                        applyHeightToFirstAscent: false,
                        applyHeightToLastDescent: false,
                      ),
                    ),
                  ),
                  Container(
                    //color: Color.fromRGBO(0x29, 0x46, 0x8e, 1),
                    width: 140,
                    alignment: .center,
                    child: Text(
                      'Countdown',
                      style: TextStyle(
                        fontSize: 21,
                        fontFamily: 'Antipasto',
                        fontWeight: .w600,
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
            //Visiblity: Pomodoro Time//
            // Session Time
            Visibility(
              visible: timerType[0],
              child: SizedBox(
                width: 289,
                height: 40,
                child: ToggleButtons(
                  isSelected: pomodoroType,
                  onPressed: (int index) {
                    setState(() {
                      if (index == 0) {
                        pomodoroType[0] = true;
                        pomodoroType[1] = false;
                        pomodoroType[2] = false;
                      }
                      else if (index == 1) {
                        pomodoroType[0] = false;
                        pomodoroType[1] = true;
                        pomodoroType[2] = false;
                      }
                      else if (index == 2) {
                        pomodoroType[0] = false;
                        pomodoroType[1] = false;
                        pomodoroType[2] = true;
                      }
                      print(pomodoroType);
                    });
                  },
                  borderRadius: BorderRadius.circular(16),
                  selectedColor: Color.fromRGBO(0xd1, 0xc8, 0xa9, 1),
                  fillColor: Color.fromRGBO(0x29, 0x46, 0x8e, 1),
                  color: Color.fromRGBO(0x29, 0x46, 0x8e, 1),
                  children: <Widget>[
                    Container(
                      //color: Color.fromRGBO(0x29, 0x46, 0x8e, 1),
                        width: ((280/3).toInt()).toDouble(),
                        alignment: .center,
                        child: Row(
                          mainAxisAlignment: .center,
                          children: <Widget>[
                            Text(
                              '30 ',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'LexendExa',
                                //fontWeight: .w600,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false,
                                applyHeightToLastDescent: false,
                              ),
                            ),
                            Text(
                              'min',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Antipasto',
                                fontWeight: .w600,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false,
                                applyHeightToLastDescent: false,
                              ),
                            ),
                          ],
                        )
                    ),
                    Container(
                      //color: Color.fromRGBO(0x29, 0x46, 0x8e, 1),
                      width: ((280/3).toInt()).toDouble(),
                      alignment: .center,
                      child: Row(
                        mainAxisAlignment: .center,
                        children: <Widget>[
                          Text(
                            '50 ',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'LexendExa',
                              //fontWeight: .w600,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false,
                              applyHeightToLastDescent: false,
                            ),
                          ),
                          Text(
                            'min',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Antipasto',
                              fontWeight: .w600,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false,
                              applyHeightToLastDescent: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      //color: Color.fromRGBO(0x29, 0x46, 0x8e, 1),
                        width: ((280/3).toInt()).toDouble(),
                        alignment: .center,
                        child: Row(
                          mainAxisAlignment: .center,
                          children: <Widget>[
                            Text(
                              '1 ',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'LexendExa',
                                //fontWeight: .w600,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false,
                                applyHeightToLastDescent: false,
                              ),
                            ),
                            Text(
                              'hour',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Antipasto',
                                fontWeight: .w600,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false,
                                applyHeightToLastDescent: false,
                              ),
                            ),
                          ],
                        )
                    ),
                  ],
                ),
              ),
            ),
            //Break Title//
            Row(
              mainAxisAlignment: .spaceEvenly,
              children: <Widget>[
                Container(
                  width: 200,
                  height: 40,
                  margin: EdgeInsets.only(top: 15),
                  alignment: .centerLeft,
                  child: Text(
                    'Break Duration',
                    style: TextStyle(
                      fontSize: 26,
                      fontFamily: 'Antipasto',
                      fontWeight: .w700,
                      color: Color.fromRGBO(0x29, 0x14, 0x19, 1),
                    ),
                    textHeightBehavior: TextHeightBehavior(
                      applyHeightToFirstAscent: false,
                      applyHeightToLastDescent: false,
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  width: 30,
                  height: 40,
                  margin: EdgeInsets.only(top: 15),
                  alignment: .centerRight,
                  child: Text(
                    '$breakMins',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'LexendExa',
                      fontWeight: .w500,
                      color: Color.fromRGBO(0x29, 0x14, 0x19, 1),
                    ),
                    textHeightBehavior: TextHeightBehavior(
                      applyHeightToFirstAscent: false,
                      applyHeightToLastDescent: false,
                    ),
                  ),
                ),
                Container(
                  width: 42,
                  height: 40,
                  margin: EdgeInsets.only(top: 15),
                  alignment: .centerRight,
                  child: Text(
                    ' mins',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Antipasto',
                      fontWeight: .w500,
                      color: Color.fromRGBO(0x29, 0x14, 0x19, 1),
                    ),
                    textHeightBehavior: TextHeightBehavior(
                      applyHeightToFirstAscent: false,
                      applyHeightToLastDescent: false,
                    ),
                  ),
                ),
              ],
            ),
            //Break Time
            SizedBox(
              width: 289,
              height: 40,
              child: Slider(
                min: 1,
                divisions: 30,
                value: (breakMins).toDouble(),
                max: 30,
                onChanged: (double value) {
                  setState(() {
                    breakMins = (value).toInt();
                  });
                },
                activeColor: Color.fromRGBO(0xc5, 0x91, 0x11, 1),
                allowedInteraction: .tapAndSlide,
                mouseCursor: SystemMouseCursors.grabbing,
              ),
            ),
            //Type Title//
            Container(
              width: 280,
              height: 40,
              margin: EdgeInsets.only(top: 15),
              alignment: .centerLeft,
              child: Text(
                'Session Type',
                style: TextStyle(
                  fontSize: 26,
                  fontFamily: 'Antipasto',
                  fontWeight: .w700,
                  color: Color.fromRGBO(0x29, 0x14, 0x19, 1),
                ),
                textHeightBehavior: TextHeightBehavior(
                  applyHeightToFirstAscent: false,
                  applyHeightToLastDescent: false,
                ),
              ),
            ),
            //Type Dropdown//
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                color: Color.fromRGBO(0x29, 0x46, 0x8e, 1),
              ),
              width: 283,
              height: 40,
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(top: 0),
              alignment: .center,
              child: DropdownButton(
                value: selectedType,
                icon: Icon(Icons.arrow_drop_down_rounded, size: 20, color: Color.fromRGBO(0xec, 0xd5, 0x14, 1),),
                items: Types.TypeList.map<DropdownMenuItem<Types>>((Types typeItem) {
                  return DropdownMenuItem<Types>(
                    value: typeItem,
                    child: Container(
                      width: 245,
                      height: 45,
                      alignment: .centerLeft,
                      child: Text(
                        typeItem.getTitle,
                        style: TextStyle(
                          fontSize: 21,
                          fontFamily: 'Antipasto',
                          fontWeight: .w700,
                          color: Color.fromRGBO(0xec, 0xd5, 0x14, 1),
                        ),
                        textHeightBehavior: TextHeightBehavior(
                          applyHeightToFirstAscent: false,
                          applyHeightToLastDescent: false,
                        ),
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (Types? value) {
                  setState(() {
                    if (value != null) {
                      selectedType = value;
                    }
                  });
                },
              ),
            ),
            //Category Title//
            Container(
              width: 280,
              height: 40,
              margin: EdgeInsets.only(top: 15),
              alignment: .centerLeft,
              child: Text(
                'Category',
                style: TextStyle(
                  fontSize: 26,
                  fontFamily: 'Antipasto',
                  fontWeight: .w700,
                  color: Color.fromRGBO(0x29, 0x14, 0x19, 1),
                ),
                textHeightBehavior: TextHeightBehavior(
                  applyHeightToFirstAscent: false,
                  applyHeightToLastDescent: false,
                ),
              ),
            ),
            //Category Dropdown//
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                color: Color.fromRGBO(0x29, 0x46, 0x8e, 1),
              ),
              width: 283,
              height: 40,
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(top: 0),
              alignment: .center,
              child: DropdownButton(
                value: selectedCategory,
                icon: Icon(Icons.arrow_drop_down_rounded, size: 20, color: Color.fromRGBO(0xec, 0xd5, 0x14, 1),),
                items: Categories.CategoryList.map<DropdownMenuItem<Categories>>((Categories categoryItem) {
                  return DropdownMenuItem<Categories>(
                    value: categoryItem,
                    child: Container(
                      width: 245,
                      height: 45,
                      alignment: .centerLeft,
                      child: Text(
                        categoryItem.getTitle,
                        style: TextStyle(
                          fontSize: 21,
                          fontFamily: 'Antipasto',
                          fontWeight: .w700,
                          color: Color.fromRGBO(0xec, 0xd5, 0x14, 1),
                        ),
                        textHeightBehavior: TextHeightBehavior(
                          applyHeightToFirstAscent: false,
                          applyHeightToLastDescent: false,
                        ),
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (Categories? value) {
                  setState(() {
                    selectedCategory = value!;
                  });
                },
              ),
            ),
            //Start Session Button//
            Container(
              width: 203,
              height: 85,
              margin: EdgeInsets.only(top: 30),
              alignment: .center,
              child: GestureDetector(
                onTap: () async {
                  /** if (selectedType == null || selectedCategory == null) {
                    // Show a message to the user and stop.
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please select a session type and category.')),
                    );
                    return; // Stop execution
                  } **/
                  //Close confirmation Pop-Up; To Timer Page
                  print('start session button works!');
                  Navigator.of(timerDialogContext).pop();
                  //timer type
                  if (timerType[0])
                    selectedTimer = 'Pomodoro';
                  else if (timerType[1])
                    selectedTimer = 'Countdown';

                  if (selectedTimer == 'Pomodoro') {
                    if (pomodoroType[0]) {//30mins
                      workMins = 1; ////FIX POST TEST
                    }
                    else if (pomodoroType[1]) {//30mins
                      workMins = 50;
                    }
                    else if (pomodoroType[2]) {//30mins
                      workMins = 60;
                    }
                  }
                  else if (selectedTimer == 'Countdown') {
                    workMins = 0;
                  }

                  final result = await Navigator.push(pageContext, MaterialPageRoute(
                      builder: (context) => TimerPage(
                        session: Session(
                          workMins,
                          breakMins,
                          timerType: selectedTimer,
                          sessionType: selectedType,
                          category: selectedCategory,
                          timeStarted: DateTime.now(),
                        )
                      )
                  ));
                  if (result == 'trueCancel') {
                    showDialog(
                        context: pageContext,
                        builder: (BuildContext dialogContext) {
                          return CancelledSessionDialog();
                        }
                    );
                  }
                  if (result == 'trueFinish') {
                    showDialog(
                        context: pageContext,
                        builder: (BuildContext dialogContext) {
                          return EndSessionDialog();
                        }
                    );
                  }
                },
                child: Container(
                    width: 203,
                    height: 85,
                    alignment: .center,
                  child: Stack(
                    alignment: .topCenter,
                    children: <Widget>[
                      Positioned(
                        top: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            color: Color.fromRGBO(0x29, 0x14, 0x19, 1),
                          ),
                          width: 203,
                          height: 44,
                          padding: EdgeInsets.only(left: 5),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            color: Color.fromRGBO(0xec, 0xd5, 0x14, 1),
                          ),
                          width: 203,
                          height: 44,
                          padding: EdgeInsets.only(left: 5),
                          alignment: .center,
                          child: Text(
                            'Start Session!',
                            textAlign: .center,
                            style: TextStyle(
                              fontSize: 26,
                              fontFamily: 'Antipasto',
                              fontWeight: .w900,
                              color: Color.fromRGBO(0x09, 0x28, 0x75, 1),
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}