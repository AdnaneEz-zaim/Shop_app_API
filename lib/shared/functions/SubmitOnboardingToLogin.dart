import 'package:shop_app_api/modules/Login/LoginScreen.dart';
import 'package:shop_app_api/shared/netWork/cach_helper.dart';
import 'navigationFunctions.dart';

void SubmitOnBoardingToLogin(context){

  CacheHelper.SaveData("onBoarding", true).then((value) {
    navigateAndFinish(context,LogingScreen());
  }).catchError((onError){
    print('erreur cachHelper'+onError);
  });

}