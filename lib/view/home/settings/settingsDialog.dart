import 'package:final_project/controller/settingsController.dart';
import 'package:final_project/model/themeData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsDialog extends StatefulWidget {
  SettingsDialog();

  @override
  State<StatefulWidget> createState() => _SettingsDialogState();
}
class _SettingsDialogState extends State<SettingsDialog>{
  _SettingsDialogState();

  List<bool> lockAcess = [true, false]; //yes lock, no lock
  List<bool> startDay = [true, false]; //Mon, sun
  bool lockAccessUsed = SettingsController.getLockAcess;
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      //insetPadding: EdgeInsets.only(top: 10), // Adjust as needed
      backgroundColor: Color.fromRGBO(0xfa, 0xfc, 0xfb, 1),
      title: Row(
        mainAxisAlignment: .center,
        children: <Widget>[
          Text(
            'Settings',
            style: TextStyle(
              fontSize: CatBuddyThemeData.fontSize*26,
              fontFamily: CatBuddyThemeData.font,
              fontWeight: FontWeight.bold,
              color: CatBuddyThemeData.mainColor,
            ),
          ),
          Spacer(),
          IconButton(
              onPressed: () {
                //Close BG Settings dialog
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.close_rounded, size: 20, color: CatBuddyThemeData.mainColor, weight: 8,)),
        ],
      ),
      titlePadding: EdgeInsets.only(top: 10, left: 15),
      insetPadding: EdgeInsets.only(top: 250),
      children: <Widget>[
        Container(
          width: 335,
          height: 700,
          alignment: .topLeft,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 15),
            children: <Widget>[
              //Lock access to other apps
              Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 5),
                  child: Text(
                    'Lock access to other apps',
                    textAlign: .left,
                    style: TextStyle(
                      fontSize: CatBuddyThemeData.fontSize*22,
                      fontFamily: CatBuddyThemeData.font,
                      fontWeight: FontWeight.bold,
                      color: CatBuddyThemeData.mainColor,
                    ),
                    textHeightBehavior: TextHeightBehavior(
                      applyHeightToFirstAscent: false,
                      applyHeightToLastDescent: false,
                    ),
                  )
              ),
              //Description
              Padding(
                padding: EdgeInsetsGeometry.only(bottom: 3),
                child: Text(
                  'You will be unable to leave the app during a work session',
                  textAlign: .left,
                  style: TextStyle(
                    fontSize: CatBuddyThemeData.fontSize*14,
                    fontFamily: CatBuddyThemeData.font,
                    color: CatBuddyThemeData.mainColor,
                    height: 0.9,
                  ),
                  textHeightBehavior: TextHeightBehavior(
                    applyHeightToFirstAscent: false,
                    applyHeightToLastDescent: false,
                  ),
                ),
              ),
              //Agree Button
              Container(
                width: 335,
                padding: EdgeInsets.only(top: 10),
                alignment: .center,
                child: ToggleButtons(
                  isSelected: lockAcess,
                  onPressed: (int index) {
                    setState(() {
                      lockAcess[0] = !lockAcess[0];
                      lockAcess[1] = !lockAcess[1];
                      if (lockAcess[0]) {
                        SettingsController.setLockAcess = true;
                      }
                      else if (lockAcess[1]) {
                        SettingsController.setLockAcess = false;
                      }
                      print(lockAccessUsed);
                    });
                  },
                  borderRadius: BorderRadius.circular(16),
                  selectedColor: CatBuddyThemeData.whiteColor,
                  fillColor: Color.fromRGBO(0x29, 0x46, 0x8e, 1),
                  color: Color.fromRGBO(0x29, 0x46, 0x8e, 1),
                  children: <Widget>[
                    Container(
                      width: ((280/3).toInt()).toDouble(),
                      alignment: .center,
                      child: Text(
                        'Yes',
                        style: TextStyle(
                          fontSize: CatBuddyThemeData.fontSize*18,
                          fontFamily: CatBuddyThemeData.font,
                          fontWeight: .bold,
                        ),
                        textHeightBehavior: TextHeightBehavior(
                          applyHeightToFirstAscent: false,
                          applyHeightToLastDescent: false,
                        ),
                      ),
                    ),
                    Container(
                      width: ((280/3).toInt()).toDouble(),
                      alignment: .center,
                      child: Text(
                        'No',
                        style: TextStyle(
                          fontSize: CatBuddyThemeData.fontSize*18,
                          fontFamily: CatBuddyThemeData.font,
                          fontWeight: .bold,
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
              //Message
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 5),
                child: Text(
                  'Message',
                  textAlign: .left,
                  style: TextStyle(
                    fontSize: CatBuddyThemeData.fontSize*22,
                    fontFamily: CatBuddyThemeData.font,
                    fontWeight: FontWeight.bold,
                    color: CatBuddyThemeData.mainColor,
                  ),
                  textHeightBehavior: TextHeightBehavior(
                    applyHeightToFirstAscent: false,
                    applyHeightToLastDescent: false,
                  ),
                ),
              ),
              //Description
              Padding(
                padding: EdgeInsetsGeometry.only(bottom: 3),
                child: Text(
                  'The message that is displayed on the home and timer page',
                  textAlign: .left,
                  style: TextStyle(
                    fontSize: CatBuddyThemeData.fontSize*14,
                    fontFamily: CatBuddyThemeData.font,
                    color: CatBuddyThemeData.mainColor,
                    height: 0.9,
                  ),
                  textHeightBehavior: TextHeightBehavior(
                    applyHeightToFirstAscent: false,
                    applyHeightToLastDescent: false,
                  ),
                ),
              ),
              //Input Message
              Container(
                width: 335,
                padding: EdgeInsets.only(top: 10),
                alignment: .center,
                child: Container(
                  decoration: BoxDecoration(
                    color: CatBuddyThemeData.defaultColors[6],
                    borderRadius: BorderRadius.circular(8),
                    shape: BoxShape.rectangle,
                  ),
                  margin: EdgeInsets.only(top: 2),
                  padding: EdgeInsets.all(5),
                  alignment: .center,
                  width: 335,
                  height: 60,
                  child: TextField(
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: CatBuddyThemeData.fontSize*20,
                      fontFamily: CatBuddyThemeData.font,
                      height: 0.5,
                    ),
                    textAlignVertical: .center,
                    controller: messageController,
                  ),
                ),
              ),
              //Apply
              SizedBox(
                width: 40,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromRGBO(0xec, 0xd5, 0x14, 1),
                    fixedSize: Size(40, 25),
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () {
                    print('apply settings works!');
                    SettingsController.setMessage = messageController.text;
                  },
                  child: Text(
                    'Apply',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Antipasto',
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(0x09, 0x28, 0x75, 1),
                    ),
                    textHeightBehavior: TextHeightBehavior(
                      applyHeightToLastDescent: false,
                      applyHeightToFirstAscent: false,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}