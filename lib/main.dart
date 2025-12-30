import 'package:final_project/model/themeData.dart';
import 'package:final_project/view/home/MyHomePage.dart';
import 'package:final_project/view/home/centerWidget/lists/Categories/CategoryListBlock.dart';
import 'package:final_project/view/home/centerWidget/lists/Types/typeListBlock.dart';
import 'package:final_project/view/timerPage/timerPage.dart';
import 'package:flutter/material.dart';

import 'controller/ThemeController.dart';
import 'model/cat.dart';

void main() {

  Types.clearTypeList();
  Types type1 = new Types(title: 'Study', icon: Icons.book_rounded);
  Types type2 = new Types(title: 'Work', icon: Icons.work_rounded);
  Categories.clearCategoryList();
  Categories category1 = new Categories(title: 'NuMeth', color: Colors.blueAccent);
  Categories category2 = new Categories(title: 'AppDev', color: Colors.deepPurple);
  Categories category3 = new Categories(title: 'Automata', color: Colors.deepOrange);
  Categories category4 = new Categories(title: 'AcadWri', color: Colors.redAccent);
  Categories category5 = new Categories(title: 'SoftEngg', color: Colors.yellow);

  Cat Flake = new Cat(CatBuddyThemeData.whiteCat, 'Flake', 'A cheerful doodle cat with the purest smile. Simple, sweet, and happy to be here.');
  Cat Cookie = new Cat(CatBuddyThemeData.tuxedoCat, 'Cookie', 'A soft kitty with cute dark patches. Loves cuddles and gentle head tilts.');
  Cat Sol = new Cat(CatBuddyThemeData.gingerCat, 'Sol', 'A bright yellow kitty full of sunshine. Always curious, always cheerful.');
  Cat Kopi = new Cat(CatBuddyThemeData.brownCat, 'Kopi', 'A gentle mocha-colored cat who loves quiet company. Soft voice, softer heart.');
  Cat Nyx = new Cat(CatBuddyThemeData.blackCat, 'Nyx', 'A sleek black kitty with a glowing outline. Mysterious but incredibly sweet.');
  Cat Tapia = new Cat(CatBuddyThemeData.tilapiaCat, 'Tapia', 'A playful tabby cat decorated with little stripes and spots. Easily excited by anything that moves.');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catto Study Buddy',
      theme: ThemeData( //what does this do?ToT
        //colorScheme: .fromSeed(seedColor: Color(0xff092875)),
      ),
      home: const MyHomePage(),
    );
  }
}