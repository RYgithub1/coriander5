import 'package:flutter/material.dart';


class MainModel extends ChangeNotifier {
  String nameText = "スアレスです";

  //  外からnameTextを変更できるようにする
  void changeNameText() {
    nameText = "ロナウジーニョへパス!";
    // 変更を通知するメソッド
    notifyListeners();
  }
}