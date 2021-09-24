import 'package:flutter_bloc/flutter_bloc.dart';

import 'StatesRegister.dart';

class RegisterCubit extends Cubit<StatesRegister> {
  bool visiblepassword=false;
  bool visibleConPassword=false;
  RegisterCubit() : super(StateInitiaRegister());

  static get(context) => BlocProvider.of<RegisterCubit>(context);

  void ChangeIconPassword(){
    visiblepassword=!visiblepassword;
    emit(StateChangeVisibileterRegisterPassword());
  }
  void ChangeIconConfirmePassword(){
    visibleConPassword=!visibleConPassword;
    emit(StateChangeVisibileterRegisterConfiPassword());
  }

}