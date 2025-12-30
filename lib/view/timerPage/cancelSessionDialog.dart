import 'package:final_project/model/themeData.dart';
import 'package:flutter/material.dart';

class CancelSessionDialog extends StatelessWidget {
  CancelSessionDialog();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromRGBO(0xfa, 0xfc, 0xfb, 1),
      title: Text(
        'Cancel Session',
        style: TextStyle(
          fontSize: 25,
          fontFamily: 'LexendExa',
          fontWeight: .w800,
          color: CatBuddyThemeData.minorColor2,
        ),
      ),
      content: Text(
        'Are you sure you want to cancel the session?',
        style: TextStyle(
          fontSize: 20,
          fontFamily: 'Antipasto',
          color: Color.fromRGBO(0x29, 0x14, 0x19, 1),
        ),
      ),
      actions: <Widget>[
        //End Session//
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: CatBuddyThemeData.minorColor2,
            fixedSize: Size(95, 25),
          ),
          onPressed: () {
            print('End session button works!');
            //Close confirmation Pop-Up; Back to Main Page
            Navigator.of(context).pop(true);
          },
          child: Text(
            'Cancel',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'LexendExa',
              fontWeight: .w800,
              color: Color.fromRGBO(0xfa, 0xfc, 0xfb, 1),
            ),
          ),
        ),
        //Don't End Session//
        TextButton(
          style: TextButton.styleFrom(
            //backgroundColor: CatBuddyThemeData.accentColor,
            fixedSize: Size(95, 25),
          ),
          onPressed: () {
            print('End session button works!');
            //Close confirmation Pop-Up
            Navigator.of(context).pop(false);
          },
          child: Text(
            'Back',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'LexendExa',
              fontWeight: .w800,
              color: CatBuddyThemeData.minorColor2,
            ),
          ),
        ),
      ],
    );
  }

}