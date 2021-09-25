import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_api/shared/Colors/Colors.dart';

Widget MyIconButton(IconData icon) {
  return Container(
    padding: const EdgeInsets.only(left: 8,top: 4),
    // decoration: myBoxDecoration(), //             <--- BoxDecoration here
    child: IconButton(onPressed: (){},icon: Icon(icon,size: 28,color: MyBlueBg,),),
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