import 'package:code/Theme/MyTheme.dart';
import 'package:code/provider/themeprovider.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings_Tap extends StatefulWidget {

  @override
  State<Settings_Tap> createState() => _Settings_TapState();
}

class _Settings_TapState extends State<Settings_Tap> {
  @override
  Widget build(BuildContext context) {
    var themes = Provider.of<themeprovider>(context);
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40 , vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Theme" , style:themes.isdark()?Theme.of(context).textTheme.headline1?.copyWith(color: Colors.white) :Theme.of(context).textTheme.headline1?.copyWith(color: MyTheme.LightBlack),) ,
                DayNightSwitcher(
                  isDarkModeEnabled: themes.isdark(),
                  onStateChanged: (isDarkModeEnabled) {
                    if(themes.isdark()){
                      themes.chagetheme(ThemeMode.light);
                    }
                    else{
                      themes.chagetheme(ThemeMode.dark);
                    }

                  },
                ),
              ],
            )
          ],
        ),
      ),
    ) ;
  }
}
