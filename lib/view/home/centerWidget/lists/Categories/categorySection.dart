import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CategoryListBlock.dart';

class CategorySection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CategorySectionState();
}
class _CategorySectionState extends State<CategorySection> {

  _CategorySectionState();

  bool arrowType = true;
  IconData? arrow;

  @override
  Widget build(BuildContext context) {
    if (arrowType) {
      arrow = Icons.arrow_drop_down_rounded;
    }
    else if (!arrowType) {
      arrow = Icons.arrow_drop_up_rounded;
    }

    return Column(
      children: <Widget>[
        //Title | Dropdown Button//
        Row(
          children: <Widget>[
            //Title//
            Text(
              'Categories',
              style: TextStyle(
                fontSize: 30,
                fontWeight: .bold,
                color: Color.fromRGBO(0x29, 0x14, 0x19, 1),
              ),
              textHeightBehavior: TextHeightBehavior(
                applyHeightToFirstAscent: false,
                applyHeightToLastDescent: false,
              ),
            ),
            //Dropdown Button//
            IconButton(
              onPressed: () {
                setState(() {
                  arrowType = !arrowType;
                });
              },
              icon: Icon(arrow, size: 25, color: Color.fromRGBO(0x29, 0x14, 0x19, 1),),
            )
          ],
        ),
        //List//
        ////Title | Icon
        Visibility(
          visible: arrowType,
          child: Container(
            constraints: BoxConstraints(
              minHeight: 10,
              maxHeight: 250,
            ),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: Categories.CategoryList.length,
                itemBuilder: (BuildContext, int index) {
                  return new CategoryWidget(index: index);
                }
            ),
          ),
        ),
      ],
    );
  }
}