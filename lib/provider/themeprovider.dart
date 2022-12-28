import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class themeprovider extends ChangeNotifier {
  ThemeMode theme = ThemeMode.light;
  void chagetheme (ThemeMode themeMode) async {
    if (themeMode == theme) {return;}
    final pref = await SharedPreferences.getInstance();
    theme = themeMode ;
    await pref.setString("theme", isdark()?"Dark":"Light");
    notifyListeners();
  }
  bool isdark (){
    return theme == ThemeMode.dark;
  }
}