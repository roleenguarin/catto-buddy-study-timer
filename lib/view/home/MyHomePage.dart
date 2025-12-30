import 'dart:io';

import 'package:final_project/model/themeData.dart';
import 'package:final_project/view/home/centerWidget/lists/listsCenter.dart';
import 'package:final_project/view/home/coinDisplayWidget.dart';
import 'package:final_project/view/home/messageWidget.dart';
import 'package:final_project/view/home/shopDialog.dart';
import 'package:final_project/view/home/settings/bgSettingsDialog.dart';
import 'package:final_project/view/home/settings/settingsDialog.dart';
import 'package:flutter/material.dart';
import '../../controller/ThemeController.dart';
import '../../model/bgType.dart';
import 'centerWidget/timer/timerCenter.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  TimerCenter timerCenter = TimerCenter();
  ListsCenter listsCenter = ListsCenter();
  late Widget centerWidget = timerCenter;

  BoxDecoration buildBackground(bool isImage, String? image, Color? color) {
    if (!isImage) { //Color
      CatBuddyThemeData.bgColor = color!;
      return BoxDecoration(
        color: CatBuddyThemeData.bgColor,
      );
    }
    else if (isImage && image != CatBuddyThemeData.bgImageDefault) { //Image
      CatBuddyThemeData.bgImage = image!;
    }
    else { //Default Image
      CatBuddyThemeData.bgImage = CatBuddyThemeData.bgImageDefault;
    }
    return BoxDecoration(
      image: DecorationImage(
          image: AssetImage(CatBuddyThemeData.bgImage), fit: BoxFit.cover
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    centerWidget = timerCenter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10,
      ),
      body: ValueListenableBuilder(
          valueListenable: ThemeController.backgroundNotifier,
          builder: (context, value, child) {
            ImageProvider imageProvider;
            if (value.type == BackgroundType.file) {
              // Use FileImage for user-picked images
              imageProvider = FileImage(File(value.path));
            } else {
              // Use AssetImage for default/pre-made backgrounds
              imageProvider = AssetImage(value.path);
            }
            //APPEARANCE: Background//
            return DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: .start,
                      crossAxisAlignment: .center,
                      children: [
                        //Coin Display | Store Button//
                        Row(
                          spacing: 5,
                          children: <Widget>[
                            //Coin Display//
                            CoinDisplayWidget(),
                            //Store Button//
                            Container(
                              padding: EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              width: 35,
                              height: 35,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                iconSize: 35,
                                style: IconButton.styleFrom(
                                  backgroundColor: Color.fromRGBO(0xfa, 0xfc, 0xfb, 0.6),
                                  shape: CircleBorder(),
                                ),
                                onPressed: () {
                                  print('store button works!');
                                  //Open Store Pop-Up
                                  showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (BuildContext shopContext) {
                                        return ShopDialog(parentContext: context);
                                      }
                                  );
                                },
                                icon: Icon(Icons.shopping_basket_rounded, size: 25, color: CatBuddyThemeData.mainColor,),
                              ),
                            ),
                          ],
                        ),
                        //Message//
                        MessageWidget(),
                        //Icons: Timer, Lists//
                        Row(
                          mainAxisAlignment: .spaceEvenly,
                          children: <Widget>[
                            //Timer Icon//
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: CatBuddyThemeData.accentColor,
                              ),
                              margin: EdgeInsets.only(top: 20),
                              width: 35,
                              height: 35,
                              alignment: .center,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  print('timer page button works!');
                                  if (centerWidget != timerCenter) {
                                    setState(() {
                                      //Open Timer Page
                                      centerWidget = timerCenter;
                                    });
                                  }
                                },
                                icon: Stack(
                                  children: <Widget>[
                                    //Inner Fill (white)//
                                    Positioned(
                                      top: 7,
                                      left: 7,
                                      child: Container(
                                        width: 18,
                                        height: 18,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          color:CatBuddyThemeData.whiteColor,
                                        ),
                                      ),
                                    ),
                                    //Shadow (white)//
                                    Positioned(
                                      top: 1.5,
                                      left: 1,
                                      child: Icon(
                                        Icons.timer,
                                        size: 33,
                                        color: CatBuddyThemeData.whiteColor,
                                      ),
                                    ),
                                    //Actual Icon//
                                    Icon(Icons.timer, size: 35, color: CatBuddyThemeData.mainColor,),
                                  ],
                                ),
                              ),
                            ),
                            //Lists Icon//
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: CatBuddyThemeData.accentColor,
                              ),
                              margin: EdgeInsets.only(top: 20),
                              width: 35,
                              height: 35,
                              alignment: .center,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  print('lists button works!');
                                  if (centerWidget != listsCenter) {
                                    setState(() {
                                      //Open Lists Page
                                      centerWidget = listsCenter;
                                    });
                                  }
                                },
                                icon: Stack(
                                  children: <Widget>[
                                    Positioned(
                                      top: 1,
                                      child: Icon(Icons.list,
                                        size: 29,
                                        color: CatBuddyThemeData.whiteColor,),
                                    ),
                                    Icon(Icons.list, size: 29, color: CatBuddyThemeData.mainColor,),
                                  ],
                                ),),
                            ),
                          ],
                        ),
                        //Center Area//
                        centerWidget,
                        //Icons: BG, Settings//
                        Container(
                          decoration: BoxDecoration(
                            color: CatBuddyThemeData.whiteColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          margin: EdgeInsets.only(top: 20),
                          width: 180,
                          height: 45,
                          child: Row(
                            mainAxisAlignment: .spaceEvenly,
                            crossAxisAlignment: .center,
                            //spacing: 20,
                            children: <Widget>[
                              //Background Icon//
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: CatBuddyThemeData.minorColor2,
                                ),
                                alignment: .center,
                                width: 35,
                                height: 35,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    print('background button works!');
                                    //Open Background Pop-Up
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return BGSettingsDialog();
                                      },
                                    );
                                  },
                                  icon: Icon(Icons.format_paint_rounded, size: 24, color: CatBuddyThemeData.whiteColor.withOpacity(0.9),),
                                ), //color: variable//
                              ),
                              //Settings Icon//
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: CatBuddyThemeData.minorColor2,
                                ),
                                width: 35,
                                height: 35,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    print('settings button works!');
                                    //Open Settings Pop-Up
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SettingsDialog();
                                        }
                                    );
                                  },
                                  icon: Icon(Icons.settings, size: 24, color: CatBuddyThemeData.whiteColor.withOpacity(0.9),),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                ),
              ),
            );
          }
      ),
    );
  }
}