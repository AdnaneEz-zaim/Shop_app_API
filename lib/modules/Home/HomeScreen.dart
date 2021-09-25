import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_api/shared/components/ProductItem.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MyProductItem(),
          MyProductItem(),
          MyProductItem(),
          MyProductItem(),
          MyProductItem(),
          MyProductItem(),
          MyProductItem(),
          MyProductItem(),
        ],
      ),
    );
  }
}
