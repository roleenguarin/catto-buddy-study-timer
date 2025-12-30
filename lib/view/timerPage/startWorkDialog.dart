import 'package:final_project/model/themeData.dart';
import 'package:flutter/material.dart';

class StartWorkDialog extends StatelessWidget {
  StartWorkDialog();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromRGBO(0xfa, 0xfc, 0xfb, 1),
      title: Text(
        'Work Time',
        style: TextStyle(
          fontSize: 25,
          fontFamily: 'LexendExa',
          fontWeight: .w800,
          color: Color.fromRGBO(0x54, 0x18, 0x26, 1),
        ),
      ),
      content: Text(
        'You are about to continue the work session.',
        style: TextStyle(
          fontSize: 20,
          fontFamily: 'Antipasto',
          color: Color.fromRGBO(0x29, 0x14, 0x19, 1),
        ),
      ),
      actions: <Widget>[
        //Start Work Session//
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: CatBuddyThemeData.accentColor,
            fixedSize: Size(95, 25),
          ),
          onPressed: () {
            print('Start work session button works!');
            //Close confirmation Pop-Up; Back to Main Page
            Navigator.pop(context);
          },
          child: Text(
            'Okay',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'LexendExa',
              fontWeight: .w800,
              color: Color.fromRGBO(0xfa, 0xfc, 0xfb, 1),
            ),
          ),
        ),
      ],
    );
  }

}