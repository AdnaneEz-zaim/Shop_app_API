import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_api/models/HomeModel.dart';
import 'package:shop_app_api/shared/Colors/Colors.dart';
import 'package:shop_app_api/shared/Consts/InformationsNetWork.dart';

import 'MyIconButton.dart';

Widget MyProductItem(Product product,void Function()? changeFavoriete)=>Container(
    child:Column(
      children: [

        Image.network(
          product.image,
          height: 400,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          decoration: myBoxDecoration(),
          child: Row(
            children: [
              //favorite_border_outlined
              favorites[product.id]!?MyIconButton(Icons.favorite,changeFavoriete,color: Colors.red):MyIconButton(Icons.favorite_border_outlined,changeFavoriete),
              MyIconButton(Icons.mode_comment_outlined,(){}),
              Spacer(),
              MyIconButton(Icons.shopping_cart_outlined,(){}),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.name,
                maxLines: 2,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16
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
                  Text(product.price.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,color: Colors.blueAccent,
                    ),),
                  SizedBox(width: 5,),
                  if(product.price!=product.old_price)
                    Text(product.old_price.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,color: MyGreyText,
                        decoration: TextDecoration.lineThrough
                      ),),
                ],
              ),
              Container(
                decoration:BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(
                        color: MyGreyText,
                        width: 0.2,
                      )
                  ),
                ),
                child: Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Container(),
                    Positioned(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: ExpandableText(
                          product.description,
                          expandText: 'show more',
                          collapseText: 'show less',
                          maxLines: 4,
                          style: TextStyle(
                              inherit: true
                          ),
                          animation: true,
                          textDirection: TextDirection.ltr,
                          animationCurve: Curves.easeOut,
                          textAlign: TextAlign.start,
                          linkColor: Colors.grey,
                        ),
                      ),
                    ),

                  ],
                ),





              )

            ],
          ),
        ),

      ],
    )
);