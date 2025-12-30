import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//Type Class//
class Types {
  String title;
  IconData icon;
  static List<Types> TypeList = [];

  Types({required this.title, required this.icon}) {
    TypeList.add(this);
  }

  set setTitle(String title) => this.title = title;
  set setIcon(IconData icon) => this.icon = icon;

  String get getTitle => this.title;
  IconData get getIcon => this.icon;

  static void clearTypeList() {
    TypeList.clear();
  }
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Type Widget///////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class TypeWidget extends StatefulWidget {
  TypeWidget({super.key, required this.index});

  final int index;
  static List<TypeWidget> TypeWidgetList = [];


  @override
  State<StatefulWidget> createState() => _TypeWidgetState(index: index);
}
class _TypeWidgetState extends State<TypeWidget> {
  _TypeWidgetState({required this.index});

  final int index;
  late final Types type = Types.TypeList[index];

  late String typeTitle = type.getTitle;
  late IconData typeIcon = type.getIcon;

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
                        '$typeTitle',//Title
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Antipasto',
                          fontWeight: .bold,
                          color: Color.fromRGBO(0x29, 0x14, 0x19, 1),
                        ),
                      ),
                      //Icon//
                      Icon(typeIcon, size: 20, color: Color.fromRGBO(0x29, 0x14, 0x19, 1),),
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