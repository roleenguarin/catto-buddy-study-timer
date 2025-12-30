import 'package:flutter/cupertino.dart';

class SettingsController {
  //Lock access to apps
  static bool lockAccessUsed = true;
  //Message
  static final ValueNotifier<String> messageUsed = ValueNotifier('Let\'s study!');

  static bool get getLockAcess => lockAccessUsed;
  static String get getMessage => messageUsed.value;

  static set setLockAcess(bool lockAcess) => lockAccessUsed = lockAcess;
  static set setMessage(String message) => messageUsed.value = message;
}