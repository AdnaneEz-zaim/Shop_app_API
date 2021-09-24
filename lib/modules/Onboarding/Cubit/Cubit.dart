import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_api/modules/Onboarding/Cubit/states.dart';
import 'package:shop_app_api/shared/Consts/OnbordingListScreen.dart';

class OnboardingCubit extends Cubit<OnboardingStates> {

  OnboardingCubit() : super(InitialOnboardingStates());

  static get(context) => BlocProvider.of<OnboardingCubit>(context);

  void ChangeIndexOnboarding(int index){
    if(index == 0){
      isFirst=true;
      isLast=false;
      emit(FirstOnboardingStates());
    }else if(index == (onbordingPage.length -1)){
      isFirst=false;
      isLast=true;
      emit(LastOnboardingStates());
    }else{
      isFirst=false;
      isLast=false;
      emit(MindOnboardingStates());
    }
  }


}