import 'package:dio/dio.dart';

class DioHelper {
  static Dio ?dio;
  static init(){
    dio=Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type':'application/json',
        }
      )
    );
  }

  static Future<Response?> getData(String path,{Map<String, dynamic> ?queryParameters,String langue='en',String ?token}) async{
    dio?.options.headers= {'lang':langue, 'Authorization':token==null?'':token};
    return await dio?.get(path,queryParameters: queryParameters);
  }

  static Future<Response?> postData(String path,Map<String,dynamic> data,{Map<String,dynamic> ?queryParameters,String langue='en',String ?token}) async
  {
    dio?.options.headers= {'lang':langue, 'Authorization':token==null?'':token};
    return await dio?.post(path,queryParameters: queryParameters,data: data);
  }
}