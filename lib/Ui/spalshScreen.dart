import 'package:code/Theme/MyTheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:code/provider/themeprovider.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "//";
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    themeprovider themes = Provider.of<themeprovider>(context);
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Scaffold(
        backgroundColor: themes.isdark()? MyTheme.DarkBlue : MyTheme.Cyan,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Image.asset('assets/images/logo.png'),
            Image.asset('assets/images/name.png'),
          ],
        ),
      ),
    );
  }
}
