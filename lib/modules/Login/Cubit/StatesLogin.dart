import 'package:shop_app_api/models/LoginModel.dart';

abstract class StatesLogin{}
class StateInitiaLogin extends StatesLogin{}
class StateChangeVisibileterLogin extends StatesLogin{}

class StateLoadingUserLogin extends StatesLogin{
  String email,password;
  StateLoadingUserLogin(this.email,this.password);
}
class StateSuccessUserLogin extends StatesLogin{
  final LoginModel modelLogin;
  String email,password;
  StateSuccessUserLogin(this.modelLogin,this.email,this.password);
}
class StateErrorUserLogin extends StatesLogin{}