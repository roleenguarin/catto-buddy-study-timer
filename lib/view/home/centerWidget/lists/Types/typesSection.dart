import 'package:final_project/view/home/centerWidget/lists/Types/typeListBlock.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SessionTypes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SessionTypesState();
}
class _SessionTypesState extends State<SessionTypes> {

  _SessionTypesState();

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
              'Session Types',
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
              itemCount: Types.TypeList.length,
              itemBuilder: (BuildContext, int index) {
                return new TypeWidget(index: index);
              }
            ),
          ),
        ),
      ],
    );
  }
}