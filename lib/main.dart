import 'package:flutter/material.dart';
import 'package:khalsana_app/style/colors.dart';
import 'package:khalsana_app/view/loginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        primarySwatch: colorCustom,
        appBarTheme: AppBarTheme(
          backgroundColor: backgroundColor,
          elevation: 0.0,
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: '5alsana',
      home: SplashScreen(),
    );
  }
}
