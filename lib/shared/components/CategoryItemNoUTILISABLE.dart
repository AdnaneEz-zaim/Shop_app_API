import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_api/models/CategoriesModel.dart';

Widget CategoryItem(DataMod categorie)=> Padding(
  padding: const EdgeInsets.only(top: 12.0,bottom: 12,right: 8),
  child: Stack(
    alignment: AlignmentDirectional.bottomCenter,
    children: [
      Image(
        image: NetworkImage(categorie.image),
        width: 160,
        height: 100,
        fit: BoxFit.fill,
      ),
      Container(color: Colors.black.withOpacity(0.5),width: 160,child: Text(categorie.name,maxLines: 1,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: 3,),textAlign: TextAlign.center,)),
    ],
  ),
);