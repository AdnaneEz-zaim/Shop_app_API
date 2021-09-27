import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_api/shared/Colors/Colors.dart';
import 'package:shop_app_api/shared/Consts/InformationsNetWork.dart';

Widget CategoryItem(int index)=> Card(
  child: GridTile(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.eleven_mp,color: MyBlueBg,),
              Spacer(),
              Container(
                  width: 139,
                  child: Text('${categories[index].name}',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15,letterSpacing: 1,)
                    ,maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )),
            ],
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios,color: MyGreyText,)
        ],
      ),
    ),
  ),

);