import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      emit(SuccessDataStatesHomeScreen());
    }).catchError((onError){
      print("##### Erreur :"+onError.toString());
      emit(ErrorDataStatesHomeScreen());
    });
  }

}