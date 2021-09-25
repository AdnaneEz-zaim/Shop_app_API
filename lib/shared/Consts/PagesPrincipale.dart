import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_api/modules/Categories/CategoriesScreen.dart';
import 'package:shop_app_api/modules/Favories/FavoriesScreen.dart';
import 'package:shop_app_api/modules/Home/HomeScreen.dart';
import 'package:shop_app_api/modules/Messages/MessagesScreen.dart';
import 'package:shop_app_api/modules/Profile/ProfileScreen.dart';

int currentIndex=0;

List<BottomNavigationBarItem> listeNavigationBar=[
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    label: "Home",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.category_outlined),
    label: "Categories",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.favorite_border_outlined),
    label: "Favorite",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.message_outlined),
    label: "Messages",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.settings_accessibility),
    label: "Profile",
  ),
];

//la liste des screens de l'application

List<Widget> listScreens=[
  HomeScreen(),
  CategoriesScreen(),
  MyHomePageState(),
  MessagesScreen(),
  ProfileScreen(),
];