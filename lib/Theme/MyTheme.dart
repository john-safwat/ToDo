import 'package:flutter/material.dart';

class MyTheme {
  static const Blue = Color(0xff5D9CEC);
  static const Cyan = Color(0xffDFECDB);
  static const Green = Color(0xff61E757);
  static const Red = Color(0xffEC4B4B);

  static ThemeData LightTheme = ThemeData(
    primaryColor: Blue,
    accentColor: Cyan,
    appBarTheme:const AppBarTheme(
      backgroundColor: Blue,
    ),

    textTheme: const TextTheme(
      headline1: TextStyle(color: Colors.white , fontSize: 22, fontWeight: FontWeight.bold),
      headline2: TextStyle(color: Blue , fontSize: 20, fontWeight: FontWeight.bold),
      headline3: TextStyle(color: Green , fontSize: 18, fontWeight: FontWeight.bold),
      headline4: TextStyle(color: Colors.black , fontSize: 15, fontWeight: FontWeight.bold),
      headline5: TextStyle(color: Colors.black , fontSize: 12, fontWeight: FontWeight.w400),
    ),


    bottomNavigationBarTheme:const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      selectedIconTheme: IconThemeData(
        color: Blue,
        size: 36
      ),
      unselectedIconTheme: IconThemeData(
          color: Colors.grey,
          size: 30
      ),
      unselectedLabelStyle: TextStyle(fontSize: 0),
      showSelectedLabels: false,
      showUnselectedLabels: false
    ),


  );

}