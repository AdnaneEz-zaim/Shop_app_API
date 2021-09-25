import 'package:shop_app_api/modules/Login/LoginScreen.dart';
import 'package:shop_app_api/shared/netWork/cach_helper.dart';
import 'navigationFunctions.dart';

void Deconnecter(context){
  CacheHelper.putDataMode('tokin',false);
  navigateAndFinish(context, LogingScreen());
}