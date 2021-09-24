import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme =ThemeData(
  textTheme: TextTheme(
      bodyText1: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 15,
        color: Colors.black,
      )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedIconTheme: IconThemeData(
      size: 32,
    ),
    selectedLabelStyle: TextStyle(
      fontWeight: FontWeight.bold,
    ),
  ),
  scaffoldBackgroundColor: Colors.grey[50],
  appBarTheme: AppBarTheme(
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      //hadi la briti t7akam fdik twixya li kayban fiha la carte sim w batrie w wifi
    ),
    backgroundColor: Colors.grey[50],
    elevation: 0.0,
    iconTheme: IconThemeData(
        color: Colors.black45,
        size: 25
    ),
    titleTextStyle: TextStyle(
        color: Colors.black45,
        fontSize: 25),
  ),
  primarySwatch: Colors.indigo,
  iconTheme: IconThemeData(
      color: Colors.black45,
      size: 25
  ),
  fontFamily: 'Jannah',
);