import 'package:flutter/material.dart';

class CatBuddyThemeData {
  //Assets
  static String bgImageDefault = 'assets/backgrounds/default.jpg';
  static String kibbleIcon = 'assets/home/coin.png';
  static String timerClock = 'assets/home/timer/clock.svg';
  static String logsIcon = 'assets/home/logsIcon.png';
  static String timerIcon = 'assets/home/timerIcon.png';
  static String logCover = 'assets/home/logs/logBook.png';
  static String logDaily = 'assets/home/logs/logDaily.png';
  static String logMonthly = 'assets/home/logs/logMonth.png';
  static String logWeekly = 'assets/home/logs/logWeek.png';
  static String storeImage1 = 'assets/home/storeDialog/questionMark.png';
  static String storeImage12 = 'assets/home/storeDialog/questionMarkBG.png';
  static String blackCat = 'assets/cats/blackcat.png';
  static String brownCat = 'assets/cats/browncat.png';
  static String gingerCat = 'assets/cats/gingercat.png';
  static String tilapiaCat = 'assets/cats/tilapiacat.png';
  static String tuxedoCat = 'assets/cats/tuxedocat.png';
  static String whiteCat = 'assets/cats/whitecat.png';

  //Colors
  static List<Color> defaultColors = [
    //blues
    Color(0xff53c3ff), //0
    Color(0xff29468e), //1
    Color(0xff092875), //2
    //yellows
    Color(0xfff2df3d), //3
    Color(0xffecd514), //4
    Color(0xffc59111), //5
    //whites
    Color(0xffd1c8a9), //6
    Color(0xffeef5fb), //7
    Color(0xfffafcfb), //8
    Color(0xff9c8b79), //9
    //reds
    Color(0xffc95357), //10
    Color(0xffc1181d), //11
    Color(0xff291419), //12
    Color(0xff541826), //13
  ];
  static Color mainColor = defaultColors[2];
  static Color accentColor = defaultColors[5];
  static Color accentColor2 = defaultColors[4];
  static Color minorColor = defaultColors[9];
  static Color minorColor2 = defaultColors[12];
  static Color timerBGColor = defaultColors[1];
  static Color playColor = defaultColors[11];
  static Color playColor2 = defaultColors[13];
  static Color whiteColor = defaultColors[8];

  //Background
  static bool isBGImage = true; //IFL wag na tong feature na to
  static String bgImage = bgImageDefault;
  static Color bgColor = mainColor;

  //Fonts
  static List<String> fontFamilies = ['Antipasto', 'LexendExa', 'PoiretOne'];
  static String font = fontFamilies[0];
  static String fontNum = fontFamilies[1];
  static int fontSize = 1; //Multiplier
}