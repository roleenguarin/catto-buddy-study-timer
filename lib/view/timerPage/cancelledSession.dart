import 'package:final_project/model/homeModel.dart';
import 'package:final_project/model/themeData.dart';
import 'package:flutter/material.dart';

class CancelledSessionDialog extends StatelessWidget {
  CancelledSessionDialog();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromRGBO(0xfa, 0xfc, 0xfb, 1),
      title: Text(
        'Cancelled a Session',
        style: TextStyle(
          fontSize: 25,
          fontFamily: 'LexendExa',
          fontWeight: .w800,
          color: Color.fromRGBO(0x54, 0x18, 0x26, 1),
        ),
      ),
      content: Column(
        mainAxisSize: .min,
        children: <Widget>[
          //Description
          Text(
            'You have cancelled the session. Kibbles will only be earned after finishing at least one part of the session.',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Antipasto',
              color: Color.fromRGBO(0x29, 0x14, 0x19, 1),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          //Kibbles earned
          Row(
            mainAxisAlignment: .center,
            children: <Widget>[
              Text(
                'You have earned ',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Antipasto',
                  color: Color.fromRGBO(0x29, 0x14, 0x19, 1),
                ),
              ),
              Text(
                '${HomeModel.earnedKibbles}',
                style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'LexendExa',
                  color: Color.fromRGBO(0x29, 0x14, 0x19, 1),
                ),
              ),
              Text(
                ' kibbles!',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Antipasto',
                  color: Color.fromRGBO(0x29, 0x14, 0x19, 1),
                ),
              ),
            ],
          ),
        ],
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