import 'package:final_project/controller/settingsController.dart';
import 'package:final_project/model/homeModel.dart';
import 'package:final_project/model/themeData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatefulWidget{
  const MessageWidget({super.key});

  @override
  State<MessageWidget> createState() => _MessageWidgetState();
}
class _MessageWidgetState extends State<MessageWidget> {

  _MessageWidgetState();

  String fontFamily = CatBuddyThemeData.font;
  Color? color = CatBuddyThemeData.mainColor;
  double? fontSize = 25*CatBuddyThemeData.fontSize.toDouble();
  FontWeight? fontWeight = FontWeight.bold;
  FontStyle? fontStyle = .italic;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: SettingsController.messageUsed,
      builder: (BuildContext context, String value, Widget? child) {
        return Container(
          //color: Colors.white.withOpacity(0.3),
          margin: EdgeInsets.only(top: 20),
          width: 400, //411.4
          height: 130,
          alignment: .center,
          child: Stack(
            children: <Widget>[
              Text(
                "$value", //variable//
                style: TextStyle(
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 6 //?variable//
                    ..color = Color.fromRGBO(0xfa, 0xfc, 0xfb, 1), //variable//
                  fontFamily: fontFamily, //variable//
                  fontSize: fontSize, //variable//
                  fontWeight: fontWeight, //variable//
                  fontStyle: fontStyle, //variable//
                ),
              ),
              Text(
                "$value", //variable//
                style: TextStyle(
                  color: color,  //variable//
                  fontFamily: fontFamily, //variable//
                  fontSize: fontSize, //variable//
                  fontWeight: fontWeight, //variable//
                  fontStyle: fontStyle, //variable//
                ),
              ),
            ],
          ),
        );
      }
    );
  }

}