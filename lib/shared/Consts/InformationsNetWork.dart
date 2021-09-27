import 'package:shop_app_api/models/CategoriesModel.dart';
import 'package:shop_app_api/models/FavoritesModel.dart';
import 'package:shop_app_api/models/HomeModel.dart';
import 'package:shop_app_api/models/LoginModel.dart';

LoginModel ?model;
HomeModel ?homeModel;
CategoriesModel ?categoriesModel;
FavoritesModel ?favoritesModel;
List<Banner> banners=[];
List<DataMod> categories=[];
Map<int,bool> favorites={};

List<Product> products=[];
int listeLength=0;