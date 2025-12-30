import 'dart:math';

class Cat {
  String _photo = 'photo';
  String _type = 'type';
  String _description = 'description';
  int cost = 20;
  static List<Cat> catChoices = [];
  static List<Cat> catAcquired = [];


  Cat(String photo_, String type_, String desc_) {
    _photo = photo_;
    _type = type_;
    _description = desc_;

    catChoices.add(this);
  }

  static Cat buyCat() {
    int n = Random().nextInt(Cat.getCatChoicesLength);
    Cat boughtCat = catChoices[n];
    acquireCat(n);
    return boughtCat;
  }

  static void acquireCat(int n) {
    catAcquired.add(catChoices[n]);
    catChoices.removeAt(n);
  }

  static void acquireAllCats() {
    //add text @ top of buy cat dialogBox results page
  }

  static int get getCatChoicesLength => catChoices.length;
  String get getCatPhoto => _photo;
  String get getCatType => _type;
  String get getCatDescrip => _description;

}