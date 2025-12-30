import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../model/themeData.dart';

class TimerClock extends StatelessWidget {
  const TimerClock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.white.withOpacity(0.3),
      width: 400,
      height: 490,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(vertical: 9.25),
      child: Center(
        child: Column(
          children: <Widget>[
            //Clock
            Stack(
              alignment: .center,
              children: [
                //Clock Outer Outline (remove: blue)//(yellow)
                SvgPicture.asset(
                  CatBuddyThemeData.timerClock,
                  width: 371.5,
                  colorFilter: .mode(Color.fromRGBO(0x09, 0x28, 0x75, 1), .srcIn),//0x29, 0x14, 0x19//0xec, 0xd5, 0x14,
                ),
                //Actual Clock//
                SvgPicture.asset(
                  CatBuddyThemeData.timerClock,
                  width: 367,
                  colorFilter: .mode(Color.fromRGBO(0x09, 0x28, 0x75, 1), .srcIn),
                ),
                //Inner Clock Circle: Outline (white)//
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(180),
                    color: Color.fromRGBO(0xfa, 0xfc, 0xfb, 0.55),//xec, 0xd5, 0x14
                  ),
                  width: 260,
                  height: 260,
                  margin: EdgeInsets.only(top: 22, right: 2),
                ),
                //Inner Clock Circle: Fill//
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(180),
                    color: Color.fromRGBO(0x29, 0x46, 0x8e, 1),
                  ),
                  width: 257,
                  height: 257,
                  margin: EdgeInsets.only(top: 22, right: 2),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}