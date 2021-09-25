import 'package:shared_preferences/shared_preferences.dart';


//UserId
class CacheHelper{
  static  SharedPreferences ?sharedPreferences;
  static init() async{
    sharedPreferences= await SharedPreferences.getInstance();
  }

  static Future<bool?> putDataMode(String key,bool val) async{
    return await sharedPreferences?.setBool(key, val);
  }

  static dynamic? getDataMode(String key) {
    return  sharedPreferences?.get(key);
  }

  static Future<bool?> SaveData(String key,dynamic val) async{
    if(val is String) return await sharedPreferences?.setString(key, val);
    if(val is bool) return await sharedPreferences?.setBool(key, val);
    if(val is int) return await sharedPreferences?.setInt(key, val);
    if(val is double) return await sharedPreferences?.setDouble(key, val);
  }

}