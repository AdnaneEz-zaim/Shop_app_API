import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darkTheme=ThemeData(
  textTheme: TextTheme(
      bodyText1: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 15,
          color: Colors.grey[200]
      )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedIconTheme: IconThemeData(
      size: 32,
      color: Colors.grey[400],
    ),
    unselectedIconTheme: IconThemeData(
      color: Colors.grey[200],
    ),
    unselectedItemColor: Colors.grey[200],
    selectedItemColor: Colors.grey[400],
    selectedLabelStyle: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.grey[400],
    ),
    backgroundColor: Color(0xFF333739),
  ),
  scaffoldBackgroundColor: const Color(0xFF333739),
  appBarTheme: AppBarTheme(
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      //hadi la briti t7akam fdik twixya li kayban fiha la carte sim w batrie w wifi
    ),
    backgroundColor: Color(0xFF333739),
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: Colors.grey[500],

    ),
    titleTextStyle: TextStyle(
        color: Colors.grey[400],
        fontSize: 25),
  ),
  iconTheme: IconThemeData(
    color: Colors.grey[500],

  ),
  primarySwatch: Colors.grey,
  fontFamily: 'Jannah',
);


