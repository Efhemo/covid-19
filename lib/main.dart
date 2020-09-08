import 'package:covid19/k.dart';
import 'package:covid19/screens/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Covid-19 flutter',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          primaryColor: kPrimaryColor,
          primaryColorDark: kPrimaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          selectedRowColor: Colors.grey[200],
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.black),
            bodyText2: TextStyle(color: Colors.black54),
          ),
        ),
        darkTheme: ThemeData.dark().copyWith(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primaryColor: kPrimaryColor,
            primaryColorDark: kPrimaryColor,
            scaffoldBackgroundColor: Colors.black45,
            selectedRowColor: Colors.grey[900],
            textTheme: TextTheme(
                bodyText1: TextStyle(color: Colors.white),
                bodyText2: TextStyle(color: Colors.white70))),
        home: MainCovidPage());
  }
}
