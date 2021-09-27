import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_api/shared/Colors/Colors.dart';

Widget MyIconButton(IconData icon,void Function()? onPress,{Color ?color}) {
  return Container(
    padding: const EdgeInsets.only(left: 8,top: 4),
    // decoration: myBoxDecoration(), //             <--- BoxDecoration here
    child: IconButton(onPressed: onPress,icon: Icon(icon,size: 28,color: color==null?MyBlueBg:color,),),
  );
}
BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    border: Border.symmetric(
     horizontal: BorderSide(
       color: MyGreyText,
       width: 0.2,
     )
    ),
  );
}