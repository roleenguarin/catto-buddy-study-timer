import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Categories Class//
class Categories {
  String title;
  Color color;
  static List<Categories> CategoryList = [];

  Categories({required this.title, required this.color}) {
    CategoryList.add(this);
  }

  set setTitle(String title) => this.title = title;
  set setColor(Color color) => this.color = color;

  String get getTitle => this.title;
  Color get getColor => this.color;

  static void clearCategoryList() {
    CategoryList.clear();
  }
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Category Widget///////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class CategoryWidget extends StatefulWidget {
  CategoryWidget({super.key, required this.index});

  final int index;
  static List<CategoryWidget> CategoryWidgetList = [];


  @override
  State<StatefulWidget> createState() => _CategoryWidgetState(index: index);
}
class _CategoryWidgetState extends State<CategoryWidget> {
  _CategoryWidgetState({required this.index});

  final int index;
  late final Categories category = Categories.CategoryList[index];

  late String categoryTitle = category.getTitle;
  late Color categoryColor = category.getColor;

  @override
  Widget build(BuildContext context) {
    //Title | Icon | ... -> edit,delete//
    return Stack(
      children: <Widget>[
        //Shadow//
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            color: Color.fromRGBO(0x9c, 0x8b, 0x79, 1),
          ),
          width: 370,
          height: 34.5,
        ),
        //Actual Container//
        Positioned(
          top: 1,
          left: 2.3,
          child: Container(
            alignment: .center,
            padding: EdgeInsets.symmetric(horizontal: 7, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(9),
                topRight: Radius.circular(9),
                bottomLeft: Radius.circular(11.5),
                bottomRight: Radius.circular(11.5),
              ),
              color: Color.fromRGBO(0xd1, 0xc8, 0xa9, 1),
            ),
            width: 336.5,
            height: 31,
            child: Row(
              children: <Widget>[
                Container(
                  width: 322.5/2,
                  child: Row(
                    spacing: 5,
                    children: <Widget>[
                      //Title//
                      Text(
                        '$categoryTitle',//Title
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Antipasto',
                          fontWeight: .bold,
                          color: categoryColor, //Color.fromRGBO(0x29, 0x14, 0x19, 1),
                        ),
                      ),
                      //Color//
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: categoryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}