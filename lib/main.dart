import 'package:code/Theme/MyTheme.dart';
import 'package:code/Ui/HomeScreen.dart';
import 'package:code/Ui/Taps/edittaskscreen.dart';
import 'package:code/provider/themeprovider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
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
  @override
  Widget build(BuildContext context) {
    var themes = Provider.of<themeprovider>(context).theme;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          EditTaskScreen.routeName:(_) => EditTaskScreen(),
          HomeScreen.routeName : (_) => HomeScreen(),
        },
        initialRoute: HomeScreen.routeName,
        theme: MyTheme.LightTheme,
        darkTheme: MyTheme.DarkTheme,
        themeMode: themes,
    );
  }
}
