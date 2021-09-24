import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_api/shared/Consts/BlocObserver.dart';
import 'package:shop_app_api/shared/Styles/lightTheme.dart';
import 'package:shop_app_api/shared/netWork/cach_helper.dart';
import 'package:shop_app_api/shared/netWork/dio_helper.dart';

import 'layout/HomeLayout.dart';
import 'modules/Login/LoginScreen.dart';
import 'modules/Onboarding/Onboarding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  if(CacheHelper.getDataMode('onBoarding').toString()==null)
    {
      print('hadi la valeur' +CacheHelper.getDataMode('onBoarding').toString());

    }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: CacheHelper.getDataMode('tokin')==true?HomeLayout():
      (CacheHelper.getDataMode('onBoarding')==true?LogingScreen():OnboardingScreen()),
    );
  }

}
