import 'package:final_project/model/homeModel.dart';
import 'package:final_project/model/themeData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoinDisplayWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _CoinDisplayWidgetState();
}

class _CoinDisplayWidgetState extends State<CoinDisplayWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: HomeModel.coins,
      builder: (context, value, child) {
        return Container(
            decoration: BoxDecoration(
              color: CatBuddyThemeData.mainColor, //Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(22),
            ),
            width: 120,
            height: 35,
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              spacing: 2.5,
              children: <Widget>[ // TODO: Create hover over function; "You have x kibbles" HIHI KIBBLES
                //Icon//
                Image.asset(CatBuddyThemeData.kibbleIcon, width: 30),
                //Coin Amount//
                Container(
                  decoration: BoxDecoration(
                    color: CatBuddyThemeData.whiteColor,//0x53, 0xc3, 0xff
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20), topRight: Radius.circular(22), bottomRight: Radius.circular(22)),
                  ),
                  width: 120-12.5-30,
                  height: 35-10,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  alignment: .centerRight,
                  child: Text(
                    '$value',
                    textAlign: .right,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: CatBuddyThemeData.fontNum, //variable//
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
          );
      }
    );
  }


}