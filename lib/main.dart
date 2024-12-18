import 'package:flutter/material.dart';
import 'package:islamyapp/home/home_screen.dart';
import 'package:islamyapp/splash_screen.dart';
import 'package:islamyapp/tabs/hadeth/hadeth_details_screen.dart';
import 'package:islamyapp/tabs/quran/sura_details_screen.dart';
import 'package:islamyapp/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routename,
      routes: {
        SplashScreen.routename: (context) => SplashScreen(),
        HomeScreen.routename: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDetailsScreen.routName: (context) => HadethDetailsScreen(),
      },
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
