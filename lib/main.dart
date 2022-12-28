import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:code/Theme/MyTheme.dart';
import 'package:code/Ui/HomeScreen.dart';
import 'package:code/Ui/Taps/edittaskscreen.dart';
import 'package:code/Ui/spalshScreen.dart';
import 'package:code/provider/themeprovider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

void main () async{
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      ChangeNotifierProvider(
        create: (_)=> themeprovider(),
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  late themeprovider themes ;
  @override
  Widget build(BuildContext context) {
    themes = Provider.of<themeprovider>(context);
    getvalueFromShared(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        EditTaskScreen.routeName:(_) => EditTaskScreen(),
        HomeScreen.routeName : (_) => HomeScreen(),
        SplashScreen.routeName :(_) => SplashScreen(),
      },
      home: AnimatedSplashScreen(
          duration: 3000,
          splash: SplashScreen(),
          nextScreen: HomeScreen(),
          splashTransition: SplashTransition.fadeTransition,
          splashIconSize: double.infinity,
      ),
      theme: MyTheme.LightTheme,
      darkTheme: MyTheme.DarkTheme,
      themeMode: themes.theme,
    );
  }
  getvalueFromShared(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();
    if(pref.getString("theme") == "Light"){
      themes.chagetheme(ThemeMode.light);
    }else {
      themes.chagetheme(ThemeMode.dark);
    }
  }
}
