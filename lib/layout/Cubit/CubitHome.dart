import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_api/shared/Consts/PagesPrincipale.dart';

import 'StatesHome.dart';

class HomeCubit extends Cubit<StatesHomeScreen> {

  HomeCubit() : super(InitialStatesHomeScreen());

  static get(context) => BlocProvider.of<HomeCubit>(context);

  void ChangeCurrentIndex(index){
    currentIndex=index;
    emit(ChangeIndexStatesHomeScreen());
  }

  

}