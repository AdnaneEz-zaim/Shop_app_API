import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_api/models/CategoriesModel.dart';
import 'package:shop_app_api/models/FavoritesModel.dart';
import 'package:shop_app_api/models/HomeModel.dart';
import 'package:shop_app_api/shared/Consts/GlobaleVariableHome.dart';
import 'package:shop_app_api/shared/Consts/InformationsNetWork.dart';
import 'package:shop_app_api/shared/netWork/cach_helper.dart';
import 'package:shop_app_api/shared/netWork/dio_helper.dart';
import 'package:shop_app_api/shared/netWork/end_points.dart';

import 'StatesHome.dart';

class HomeCubit extends Cubit<StatesHomeScreen> {

  HomeCubit() : super(InitialStatesHomeScreen());

  static get(context) => BlocProvider.of<HomeCubit>(context);

  void ChangeCurrentIndex(index){
    currentIndex=index;
    emit(ChangeIndexStatesHomeScreen());
  }

  void GetDataHome(){
    emit(LoadingDataStatesHomeScreen());
    DioHelper.getData(HOME,token: CacheHelper.getDataMode("UserId")).then((value){
      homeModel=HomeModel.fromJson(value?.data);
      print(")))))))))))))) home data ((((((((((((((((");
      listeLength=(homeModel!=null?(homeModel?.data.products)?.length:0)!;

      products=(homeModel?.data.products)! as List<Product>;
      // banners=[];
      // products=[];
      // value?.data['data']['banners'].forEach((element) {
      //   banners.add(Banner.fromJson(element));
      // });
      // value?.data['data']['products'].forEach((element) {
      //   products.add(Product.fromJson(element));
      // });
      //
      // banners.forEach((element) {
      //   print(element.image);
      // });
      // print("################ liste produits  ################################");
      // products.forEach((element) {
      //   print(element.image);
      // });
      //print(value?.data['data']['banners'][0]);
      products.forEach((element) {
        favorites.addAll({element.id:element.in_favorites});
      });

      emit(SuccessDataStatesHomeScreen());
    }).catchError((onError){
      print("##### Erreur :"+onError.toString());
      emit(ErrorDataStatesHomeScreen());
    });
  }

  void GetCategories(){
    DioHelper.getData(CATEGORIES).then((value){
      categoriesModel=CategoriesModel.fromJson(value?.data);
      print(")))))))))))))) Categories data ((((((((((((((((");
      //listeLength=(homeModel!=null?(homeModel?.data.products)?.length:0)!;

      categories=(categoriesModel?.data.dataModel)! as List<DataMod>;
      // banners=[];
      // products=[];
      // value?.data['data']['banners'].forEach((element) {
      //   banners.add(Banner.fromJson(element));
      // });
      // value?.data['data']['products'].forEach((element) {
      //   products.add(Product.fromJson(element));
      // });
      //
      // banners.forEach((element) {
      //   print(element.image);
      // });
      // print("################ liste produits  ################################");
      // products.forEach((element) {
      //   print(element.image);
      // });
      //print(value?.data['data']['banners'][0]);
      emit(SuccessCategoriesStatesScreen());
    }).catchError((onError){
      print("##### Erreur :"+onError.toString());
      emit(ErrorCategoriesStatesScreen());
    });
  }

  void ChangeFavorite(int idProduct){
    favorites[idProduct]=!favorites[idProduct]!;
    emit(SuccessFavoriteStatesScreen());
    DioHelper.postData(FAVORITES,
        {'product_id':idProduct},
        token: CacheHelper.getDataMode("UserId")).then((value){
          if(!value?.data['status'])
            favorites[idProduct]=!favorites[idProduct]!;
          else
            GetFavorites();
      emit(SuccessFavoriteStatesScreen());
    }).catchError((onError){
      emit(ErrorFavoriteStatesScreen());
    });
  }

  void GetFavorites(){
    emit(LodingGetFavoriteStatesScreen());
    DioHelper.getData(FAVORITES,token:CacheHelper.getDataMode("UserId")).then((value){
      favoritesModel = (FavoritesModel?.fromJson(value?.data));
      emit(SuccessGetFavoriteStatesScreen());
    }).catchError((onError){
      print("##### Erreur :"+onError.toString());
      emit(ErrorGetFavoriteStatesScreen());
    });
  }
}