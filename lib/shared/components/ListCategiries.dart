import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:shop_app_api/models/CategoriesModel.dart';
import 'package:shop_app_api/shared/Colors/Colors.dart';


Widget MyListCategoriesWidget(List<DataMod> categs){
  List<String> listCategorie=[];
  int index=0;
  categs.forEach((element) {
    listCategorie.add(element.name);
  });

  return Padding(
  padding: const EdgeInsets.only(left: 12),
  child:   Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("List Categories",style: TextStyle(fontSize: 20,color: MyGreyText,fontWeight: FontWeight.w500),),
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Container(
          color: Colors.white,
          child: GroupButton(
            unselectedTextStyle: TextStyle(letterSpacing: 2,color: MyBlueBg),
            selectedTextStyle: TextStyle(fontWeight: FontWeight.w700,letterSpacing: 2,),
            selectedColor: MyBlueBg,
            spacing: 7,
            selectedButton: index,

            direction: Axis.horizontal,

            buttons: listCategorie,

            borderRadius: BorderRadius.circular(30),

            onSelected: (i, selected) {
              debugPrint('Button #$i selected');
              index=i;
            },

          ),
        ),

      ),
    ],
  ),
);
}