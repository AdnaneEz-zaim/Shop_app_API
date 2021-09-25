import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_api/shared/Consts/InformationsNetWork.dart';
List<String> images= [];
Widget MyCarouselSlider(){

  // homeModel?.data.banners.forEach((element) {
  //   //images.add(element);
  //   print(element.image);
  // });
  return CarouselSlider(
        items: homeModel?.data.banners.map((e) => Image(
          image: NetworkImage('${e.image}'),
          height: 250,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
  ).toList(), options: CarouselOptions(
    height: 250,
    initialPage: 0,
    enableInfiniteScroll: true,
    autoPlay: true,
    autoPlayInterval: Duration(seconds: 2),
    autoPlayCurve: Curves.easeOut,
    viewportFraction: 1
  ),
);
}