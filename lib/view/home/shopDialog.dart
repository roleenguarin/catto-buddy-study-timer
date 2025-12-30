import 'package:final_project/model/themeData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/cat.dart';
import '../../model/homeModel.dart';

class ShopDialog extends StatefulWidget {
  ShopDialog({required BuildContext this.parentContext});

  BuildContext parentContext;

  @override
  State<StatefulWidget> createState() => _ShopDialogState(parentContext: parentContext);
}
class _ShopDialogState extends State<ShopDialog> {
  _ShopDialogState({required BuildContext this.parentContext});

  BuildContext parentContext;

  String imageAsset = CatBuddyThemeData.storeImage1;
  String catImage = CatBuddyThemeData.storeImage1;
  String catName = 'Cat name';
  String catDescription = 'Cat description';
  String area1 = 'Buy a Cat!';
  late Widget area2;
  late bool showArea2;
  late Cat catBought;

  @override
  void initState() {
    super.initState();
    showArea2 = false;
  }

  @override
  Widget build(BuildContext shopContext) {
    if (showArea2) {
      imageAsset = catImage;
      area1 = catName;
      area2 = Text(
        catDescription,
        style: TextStyle(
          fontSize: 20,
          fontFamily: 'Antipasto',
        ),
      );
    }
    else if (!showArea2) {
      imageAsset = 'assets/home/storeDialog/questionMark.png';
      area1;
      area2 = ElevatedButton(
        style: ElevatedButton.styleFrom(
          iconAlignment: .start,
          backgroundColor: Color.fromRGBO(0xec, 0xd5, 0x14, 1),
        ),
        onPressed: () {
        },
        child: SizedBox(
          width: 120.21,
          child: TextButton(
            onPressed: () {
              catBought = HomeModel.buyACat();
              catImage = catBought.getCatPhoto;
              catName = catBought.getCatType;
              catDescription = catBought.getCatDescrip;
              print('buy button works!');
              //Change dialog contents; buy cat @ model;
              setState(() {
                showArea2 = true;
              });
            },
            child: Row(
              children: <Widget>[
                Text(
                  '20 ',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'LexendExa',
                    color: Color.fromRGBO(0x09, 0x28, 0x75, 1),
                  ),
                ),
                Text(
                  'kibbles',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Antipasto',
                    fontWeight: .w800,
                    color: Color.fromRGBO(0x09, 0x28, 0x75, 1),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return AlertDialog(
      backgroundColor: Color.fromRGBO(0xfa, 0xfc, 0xfb, 1),
      title: Row(
        children: <Widget>[
          Text(
            'Shop',
            style: TextStyle(
              fontSize: 34,
              fontFamily: 'Antipasto',
              fontWeight: .w800,
              color: Color.fromRGBO(0x09, 0x28, 0x75, 1),
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              if (catBought != null) {
                setState(() {
                  showArea2 = false;
                });
              }
              print('close button works!');
              //Close confirmation Pop-Up
              Navigator.pop(shopContext);
            },
            icon: Icon(Icons.close_rounded, size: 26, weight: 50, color: Color.fromRGBO(0x29, 0x14, 0x19, 1),),
          ),
        ],
      ),
      content: Container(
        width: 330,
        height: 450,
        child: Column(
          spacing: 10,
          children: <Widget>[
            //Question Mark//
            Container(
              //color: Color.fromRGBO(0x9c, 0x8b, 0x79,0.1),
              width: 250,
              height: 280,
              child: Image.asset('$imageAsset', width: 250),
            ),
            //Buy a Cat Text//
            Container(
              //color: Color.fromRGBO(0x9c, 0x8b, 0x79,0.1),
              width: 250,
              height: 40,
              margin: EdgeInsets.only(top: 10),
              alignment: .center,
              child: Text(
                  '$area1',
                style: TextStyle(
                  color: Color.fromRGBO(0x09, 0x28, 0x75, 1),
                  fontSize: 30,
                  fontFamily: 'Antipasto',
                  fontWeight: .w800,
                ),
              ),
            ),
            //Buy Button//
            area2,
          ],
        ),
      ),
    );
  }
}