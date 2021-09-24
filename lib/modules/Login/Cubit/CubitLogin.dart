import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_api/models/LoginModel.dart';
import 'package:shop_app_api/shared/netWork/dio_helper.dart';
import 'package:shop_app_api/shared/netWork/end_points.dart';

import 'StatesLogin.dart';

class LoginCubit extends Cubit<StatesLogin> {
  bool visible=false;
  LoginCubit() : super(StateInitiaLogin());

  static get(context) => BlocProvider.of<LoginCubit>(context);

  void ChangeIconPassword(){
    visible=!visible;
    emit(StateChangeVisibileterLogin());
  }
  void UserLogin(String email,String password){
    emit(StateLoadingUserLogin(email,password));
    DioHelper.postData(LOGIN, {'email':email,'password':password}).then((value) {
      print(value);
      LoginModel model=LoginModel.fromJson(value?.data);
      emit(StateSuccessUserLogin(model,email,password));
    }).catchError((onError){
      print(onError.toString());
      emit(StateErrorUserLogin());
    });
  }

}