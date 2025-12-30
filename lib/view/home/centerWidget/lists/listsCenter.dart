import 'Categories/categorySection.dart';
import 'package:final_project/view/home/centerWidget/lists/Types/typesSection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ListsCenter extends StatelessWidget {
  const ListsCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(0xd1, 0xc8, 0xa9, 0.95),
        borderRadius: BorderRadius.circular(23),
      ),
      width: 400,
      height: 490,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(15),
      alignment: .topCenter,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          //Session Types//
          SessionTypes(),
          //Categories//
          CategorySection(),
        ]
      )
    );
  }
}