import 'package:final_project/view/home/centerWidget/lists/Types/typeListBlock.dart';
import '../view/home/centerWidget/lists/Categories/CategoryListBlock.dart';


class Timer {
  Timer (int this.duration, int this.breakDuration, {required bool this.isPomodoro, required Types this.seshType, required Categories this.seshCategory}) {}

  int duration;
  int breakDuration;
  bool isPomodoro;
  Types seshType;
  Categories seshCategory;
}