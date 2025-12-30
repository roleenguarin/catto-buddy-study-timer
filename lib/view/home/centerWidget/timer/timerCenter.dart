import 'package:final_project/model/themeData.dart';
import 'package:final_project/view/home/centerWidget/timer/timerDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class TimerCenter extends StatelessWidget {
  const TimerCenter({super.key});

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
              children: <Widget>[
                //Clock//
                Stack(
                  alignment: .center,
                  children: [
                    //Clock Outer Outline (remove: blue)//(yellow)
                    SvgPicture.asset(
                      CatBuddyThemeData.timerClock,
                      width: 371.5,
                      colorFilter: .mode(CatBuddyThemeData.mainColor, .srcIn),
                    ),
                    //Actual Clock//
                    SvgPicture.asset(
                      CatBuddyThemeData.timerClock,
                      width: 367,
                      colorFilter: .mode(CatBuddyThemeData.mainColor, .srcIn),
                    ),
                    //Inner Clock Circle: Outline (white)//
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(180),
                        color: CatBuddyThemeData.whiteColor,//xec, 0xd5, 0x14
                      ),
                      width: 260,
                      height: 260,
                      margin: EdgeInsets.only(top: 22, right: 2),
                    ),
                    //Inner Clock Circle: Fill//
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(180),
                        color: CatBuddyThemeData.timerBGColor,
                      ),
                      width: 257,
                      height: 257,
                      margin: EdgeInsets.only(top: 22, right: 2),
                    ),
                  ],
                ),
                Positioned(
                  top: 165,
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
                          backgroundColor: CatBuddyThemeData.playColor,
                          shape: CircleBorder(),
                        ),
                        onPressed: () {
                          //Open Timer Pop-Up
                          print('play button works!');
                          showDialog(
                            context: context,
                            builder: ((timerContext) {
                              return TimerDialog(pageContext: context);
                            }),
                          );
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
                                  color: CatBuddyThemeData.playColor,//0xf2, 0xdf, 0x3d//0xc1, 0x18, 0x1d
                                ),
                              ),
                            ),
                            //Play Button (dark red purple)//
                            Icon(
                              Icons.play_circle_rounded,
                              size: 70,
                              color: CatBuddyThemeData.playColor2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            //Time
            Stack(
              alignment: .topCenter,
              children: <Widget>[
                //Time Outline//
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0xfa, 0xfc, 0xfb, 1), //0.4//0x29, 0x14, 0x19//0xec, 0xd5, 0x14
                    borderRadius: BorderRadius.circular(19),
                  ),
                  width: 351,
                  height: 99.5,
                  margin: EdgeInsets.fromLTRB(9.25, 0.5, 9.25, 0),
                ),
                //Actual Time Container//
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0x09, 0x28, 0x75, 1), //0.4
                    borderRadius: BorderRadius.circular(17),
                  ),
                  width: 347.5,
                  height: 98,
                  margin: EdgeInsets.symmetric(horizontal: 9.25),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}