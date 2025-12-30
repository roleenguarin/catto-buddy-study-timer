import 'package:final_project/model/bgType.dart';
import 'package:final_project/model/themeData.dart';
import 'package:flutter/foundation.dart';

class ThemeController {
  static final ValueNotifier<BackgroundInfo> backgroundNotifier = ValueNotifier(BackgroundInfo(
    type: BackgroundType.asset,
    path: CatBuddyThemeData.bgImageDefault,
  ));


  static void setBackground(String newImagePath) {
    backgroundNotifier.value = BackgroundInfo(type: BackgroundType.asset, path: newImagePath);
  }
}