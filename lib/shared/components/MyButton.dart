import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_api/shared/Colors/Colors.dart';

Widget MyButton(String labal,final Function()? onPressed)=>Container(
  decoration: BoxDecoration(
      color: MyBlueBg,
      borderRadius: BorderRadius.circular(45)),
  child: MaterialButton(
      onPressed: onPressed,
      minWidth: 150,
      height: 50,
      child: Text(labal,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 17
          ),
      ),
  ),
);