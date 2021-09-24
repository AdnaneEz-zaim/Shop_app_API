import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'StatesHome.dart';

class HomeCubit extends Cubit<StatesHomeScreen> {
  bool visible = false;

  HomeCubit() : super(InitialStatesHomeScreen());

  static get(context) => BlocProvider.of<HomeCubit>(context);

}