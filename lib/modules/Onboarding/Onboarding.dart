import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_api/models/OnBoardingObject.dart';
import 'package:shop_app_api/modules/Login/LoginScreen.dart';
import 'package:shop_app_api/shared/Colors/Colors.dart';
import 'package:shop_app_api/shared/Consts/OnbordingListScreen.dart';
import 'package:shop_app_api/shared/functions/SubmitOnboardingToLogin.dart';
import 'package:shop_app_api/shared/functions/navigationFunctions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Cubit/Cubit.dart';
import 'Cubit/states.dart';

class OnboardingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var pageContreller = PageController();

    return BlocProvider(
         create: (BuildContext context) => OnboardingCubit()..ChangeIndexOnboarding(0),
         child: BlocConsumer<OnboardingCubit,OnboardingStates>(
           listener: (context,state){
           },
           builder: (context,state){
             return  Scaffold(
                 body:
                 // PageView.builder(itemBuilder: itemBuilder),
                 Container(
                   color: MyBlueBg,
                   child: Column(
                     children: [
                       Expanded(
                         child: Container(
                           decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(45),
                           ),
                           child: Column(

                             children: [
                               Expanded(
                                 child: PageView.builder(
                                   onPageChanged: (index){ OnboardingCubit.get(context).ChangeIndexOnboarding(index);},
                                   controller: pageContreller,
                                   physics: BouncingScrollPhysics(),
                                   itemBuilder: (context,index)=>MyBoarding(onbordingPage[index]),
                                   itemCount: 3,
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(bottom: 40,left: 20,right: 20),
                                 child: Row(
                                   children: [
                                     isFirst?Container(width: 56,):flotingBotton(pageContreller, () {pageContreller.previousPage(duration: Duration(milliseconds: 550),curve: Curves.easeOutQuart);},Icons.arrow_back_ios_outlined,),
                                     Spacer(),
                                     SmoothPageIndicator(
                                         effect:  JumpingDotEffect(
                                           dotHeight: 12,
                                           dotWidth: 12,
                                           jumpScale: .8,
                                           verticalOffset: 2,
                                         ),
                                         controller: pageContreller,  // PageController
                                         count:  onbordingPage.length, // your preferred effect
                                         onDotClicked: (index){

                                         }
                                     ),

                                     Spacer(),
                                     flotingBotton(pageContreller,
                                           () {
                                           if(isLast){
                                             SubmitOnBoardingToLogin(context);
                                           }
                                           else {
                                             pageContreller.nextPage(duration: Duration(milliseconds: 550),
                                                 curve: Curves.easeOutQuart);
                                           }
                                        },
                                        Icons.arrow_forward_ios_rounded,),
                                   ],
                                 ),
                               )
                             ],
                           ),
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: TextButton(
                             onPressed: (){
                               SubmitOnBoardingToLogin(context);
                             },
                             child: Text("Skip".toUpperCase(),
                               style: TextStyle(fontSize: 18,color: Colors.white,fontStyle: FontStyle.normal,),)),
                       )
                     ],
                   ),
                 )
             );
           },

         ),
       );
  }

  Widget flotingBotton(PageController pageContreller,final Function()? f,IconData icon)=>FloatingActionButton(
    onPressed: f,
    child: Icon(icon),
    backgroundColor: MyBlueBg,
  );

  Widget MyBoarding(OnBoardingObject item)=>Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(image: AssetImage(item.image)),
        SizedBox(height: 10,),
        Text(item.titre,style: TextStyle(color: MyBlueBg,fontWeight: FontWeight.w700,fontSize: 22),),
        SizedBox(height: 25,),
        Text(item.description,style: TextStyle(color: MyGreyText,fontSize: 15,),textAlign: TextAlign.center,)
      ],
    ),
  );

}
