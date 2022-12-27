import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class themeprovider extends ChangeNotifier {
  ThemeMode theme = ThemeMode.light;
  void chagetheme (ThemeMode themeMode){
    theme = themeMode ;
    notifyListeners();
  }
  bool isdark (){
    return theme == ThemeMode.dark;
  }
}