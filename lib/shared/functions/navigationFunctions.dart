import 'package:flutter/material.dart';

void navigateAndFinish(context,widget)
{
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget),
          (Route<dynamic> route) => false);
}

void navigatTo(context,wiedget){
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => wiedget));
}