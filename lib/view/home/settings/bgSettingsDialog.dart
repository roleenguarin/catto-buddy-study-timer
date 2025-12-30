import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_input/image_input.dart';
import 'package:image_input/widget/image_input/image_input.dart';
import '../../../controller/ThemeController.dart';


class BGSettingsDialog extends StatefulWidget {
  BGSettingsDialog();

  @override
  State<StatefulWidget> createState() => _BGSettingsDialogState();
}

class _BGSettingsDialogState extends State<BGSettingsDialog> {
  _BGSettingsDialogState();

  List<XFile> imageInputImages = [];
  bool allowEditImageInput = true;

  ScrollController scrollController = ScrollController();
  bool bgImageVis = true;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      //insetPadding: EdgeInsets.only(top: 10), // Adjust as needed
      backgroundColor: Color.fromRGBO(0xfa, 0xfc, 0xfb, 1),
      title: Row(
        mainAxisAlignment: .center,
        children: <Widget>[
          Text(
            'Background Settings',
            style: TextStyle(
              fontSize: 26,
              fontFamily: 'Antipasto',
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(0x09, 0x28, 0x75, 1),
            ),
          ),
          Spacer(),
          IconButton(
              onPressed: () {
                //Close BG Settings dialog
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.close_rounded, size: 20, color: Color.fromRGBO(0x09, 0x28, 0x75, 1), weight: 8,)),
        ],
      ),
      titlePadding: EdgeInsets.only(top: 10, left: 15),
      insetPadding: EdgeInsets.only(top: 250),
      children: <Widget>[
        Container(
          width: 335,
          height: 700,
          alignment: .topLeft,
          child: ListView(
            controller: scrollController,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 15),
            children: <Widget>[
              //Background Section//
              Padding(
                  padding: EdgeInsets.only(bottom: 12),
                  child: Text(
                    'Background Image',
                    textAlign: .left,
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Antipasto',
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(0x09, 0x28, 0x75, 1),
                    ),
                    textHeightBehavior: TextHeightBehavior(
                      applyHeightToFirstAscent: false,
                      applyHeightToLastDescent: false,
                    ),
                  )
              ),
              //BG Image Input
              Visibility(
                visible: bgImageVis,
                child: ImageInput(
                  images: imageInputImages,
                  allowEdit: allowEditImageInput,
                  allowMaxImage: 1,
                  onImageSelected: (image) {
                    ThemeController.setBackground(image.path);
                    setState(() {
                      imageInputImages.add(image);
                    });
                  },
                  onImageRemoved: (image, index) {
                    setState(() {
                      imageInputImages.remove(image);
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}