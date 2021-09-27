import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_api/models/FavoritesModel.dart';
import 'package:shop_app_api/shared/Colors/Colors.dart';

Widget MyFavoriesItem({
required double widthScreen,
required double heigthImage,
required ProductFavorite ?product,
required void Function()? changeFavoriete})=>Container(
  height: heigthImage,
  decoration:BoxDecoration(
    border: Border.symmetric(
        horizontal: BorderSide(
          color: MyGreyText,
          width: 0.25,
        )
    ),
  ),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image(image: NetworkImage(
          product!=null?product.image.toString():""),
        width: 170,height: heigthImage,fit:BoxFit.cover,),
      Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: widthScreen-240,
                    child: Text(product!=null?product.name.toString():"",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(width: 20),
                  CircleAvatar(
                    child: IconButton(
                      onPressed: changeFavoriete,
                      icon: Icon(Icons.delete_outline,color: Colors.white,
                      ),
                      alignment: Alignment.topLeft
                      ,),
                    backgroundColor: MyBlueBg,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text("Price :",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,color: MyGreyText,
                  ),),
                SizedBox(width: 5,),
                Text((product!=null?product.price.toString():""),
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,color: Colors.blueAccent,
                  ),),
                SizedBox(width: 5,),
                if(product?.price!=product?.oldPrice)
                  Text(product!=null?product.oldPrice.toString():"",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,color: MyGreyText,
                        decoration: TextDecoration.lineThrough
                    ),),
              ],
            ),
            MaterialButton(
              padding: EdgeInsets.symmetric(horizontal: (widthScreen-(150+170))/2),
              onPressed: (){},
              child: Container(
                height: 35,
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),
                  ),
                  color: MyBlueBg,
                ),
                child: Text("Comander",
                  style: TextStyle(color: Colors.white,fontSize: 18,letterSpacing: 2,),
                  textAlign: TextAlign.center,),
              ),
            )
          ],

        ),
      )
    ],
  ),
);