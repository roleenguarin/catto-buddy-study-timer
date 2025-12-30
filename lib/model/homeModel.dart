import 'package:final_project/controller/settingsController.dart';
import 'package:flutter/cupertino.dart';
import 'cat.dart';

class HomeModel {
  static final ValueNotifier<int> coins = ValueNotifier(150);
  static final ValueNotifier<String> message = ValueNotifier(SettingsController.getMessage);
  static int earnedKibbles = 0;

  static Cat buyACat() {
    if (coins.value < 20) {
      print("Not enough coins to buy a cat!");
    }

    coins.value -=20;
    return Cat.buyCat();
  }

  static void earnKibbles(int minutes) {
    print('earn kibbles');
    coins.value += minutes;//(minutes/10).toInt()
    earnedKibbles = minutes;//(minutes/10).toInt()
    print('earned kibbles: $earnedKibbles');
  }
}