import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    icon: Icon(Icons.favorite_border_outlined),
    label: "Favorite",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.message_outlined),
    label: "Commandes",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.settings_accessibility),
    label: "Profile",
  ),
];

//la liste des screens de l'application

List<Widget> listScreens=[
  HomeScreen(),
  FavoriesScreen(),
  MessagesScreen(),
  ProfileScreen(),
];