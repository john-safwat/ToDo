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
  var themeslist = [ "Light" , "Dark"];
  var themetitle = "Light";
  var Languagelist = ["English" , "Arabic"];
  var Languagetitle = "English";
  @override
  Widget build(BuildContext context) {
    var themes = Provider.of<themeprovider>(context);
    themetitle = themes.isdark()?  "Dark" : "Light";
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30 , vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Theme" , style:themes.isdark()?Theme.of(context).textTheme.headline1?.copyWith(color: Colors.white) :Theme.of(context).textTheme.headline1?.copyWith(color: MyTheme.LightBlack),) ,
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: themes.isdark()?MyTheme.LightBlack: Colors.white,
                border: Border.all(width: 1 , color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: themetitle,
                  dropdownColor: themes.isdark()?MyTheme.LightBlack: Colors.white,
                  style: TextStyle(color: Theme.of(context).primaryColor , fontSize: 20),
                  items: themeslist.map<DropdownMenuItem<String>>((String Value){
                    return DropdownMenuItem<String>(
                      value: Value,
                      child: Text(Value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    themetitle = value!;
                    if (value == 'Light'){
                      themes.chagetheme(ThemeMode.light);
                    }else{
                      themes.chagetheme(ThemeMode.dark);
                    }
                    setState(() {});
                  },
                ),
              ),
            ),
            Text("Language" , style:themes.isdark()?Theme.of(context).textTheme.headline1?.copyWith(color: Colors.white) :Theme.of(context).textTheme.headline1?.copyWith(color: MyTheme.LightBlack),) ,
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: themes.isdark()?MyTheme.LightBlack: Colors.white,
                border: Border.all(width: 1 , color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: Languagetitle,
                  dropdownColor: themes.isdark()?MyTheme.LightBlack: Colors.white,
                  style: TextStyle(color: Theme.of(context).primaryColor , fontSize: 20),
                  items: Languagelist.map<DropdownMenuItem<String>>((String Value){
                    return DropdownMenuItem<String>(
                      value: Value,
                      child: Text(Value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    Languagetitle = value!;
                    setState(() {});
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ) ;
  }
}
