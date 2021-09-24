import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app_api/layout/HomeLayout.dart';
import 'package:shop_app_api/modules/Register/RegisterScreen.dart';
import 'package:shop_app_api/shared/Colors/Colors.dart';
import 'package:shop_app_api/shared/components/MyButton.dart';
import 'package:shop_app_api/shared/components/MyTextField.dart';
import 'package:shop_app_api/shared/components/MyToast.dart';
import 'package:shop_app_api/shared/functions/navigationFunctions.dart';
import 'package:shop_app_api/shared/netWork/cach_helper.dart';

import 'Cubit/CubitLogin.dart';
import 'Cubit/StatesLogin.dart';

class LogingScreen extends StatelessWidget {
   var formKey=GlobalKey<FormState>();
   var currentFocus;
  @override
  Widget build(BuildContext context) {
    bool loading=false;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var emailController =TextEditingController();
    var passwordController =TextEditingController();
    // Creating 3 String Variables.
    String text1='',text2='' ;

    // Getting Value From Text Field and Store into String Variable
    print("(((((((((((((((((((");
    print(passwordController.text);
    print(CacheHelper.getDataMode('onBoarding'));

    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit,StatesLogin>(
        listener: (context,state){
          if(state is StateSuccessUserLogin){
            emailController.value= TextEditingValue(text: state.email);
            passwordController.text=state.password;
            print(state.email);
              if(state.modelLogin.status){
                CacheHelper.putDataMode('tokin',true);
                navigateAndFinish(context, HomeLayout());
              }else{
                print(state.modelLogin.message);
                MyToast(state.modelLogin.message);
              }
          }
          else if(state is StateLoadingUserLogin){
            print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
            print(state.email);
            if(passwordController.text.length!=0){
              print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
              emailController.value= TextEditingValue(text: text1);
              passwordController.text=state.password;
            }

          }
        },
        builder: (context,state){
          return  Scaffold(

            body: Container(
              color: MyBlueBg,
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: height),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(200.0),
                                  bottomRight: Radius.circular(20.0),
                                )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Form(
                                key: formKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/images/logo2.png",height: 170,),
                                    SizedBox(height: 40,),
                                    MyTextField(
                                      emailController,
                                      TextInputType.emailAddress,
                                          (value){
                                        if(value!.isEmpty){
                                          return "il faut rempliare le champs de mot de pass";
                                        }
                                        return null;
                                      },
                                          (value){

                                      },
                                      "Email",
                                      Icons.email_outlined,
                                      false,

                                    ),
                                    SizedBox(height: 10,),
                                    MyTextField(
                                        passwordController,
                                        TextInputType.visiblePassword,
                                            (value){
                                          if(value!.isEmpty){
                                            return "il faut rempliare le champs de mot de pass";
                                          }
                                          return null;
                                        },
                                            (value){

                                        },
                                        "Mot de pass",
                                        Icons.lock_outline_rounded,
                                        !LoginCubit.get(context).visible,
                                        suffixIcon: LoginCubit.get(context).visible?Icons.visibility_outlined:Icons.visibility_off_outlined,
                                        onPressedIcon: (){

                                          LoginCubit.get(context).ChangeIconPassword();
                                        }
                                    ),
                                    SizedBox(height: 60,),
                                    state is StateLoadingUserLogin?Center(child: CircularProgressIndicator(color: MyBlueBg,))
                                        :
                                    MyButton("Login",
                                            (){
                                      print("------@@@@@@@@@@@@@@@@@@@@@@@@@@--------------");
                                      text1=emailController.text;
                                      text2=passwordController.text;
                                      emailController.text=emailController.text;
                                              FocusManager.instance.primaryFocus?.unfocus();
                                      emailController.text=text1;
                                      print(text1);
                                      if(formKey.currentState?.validate()==true) {
                                      LoginCubit.get(context).UserLogin(emailController.text,passwordController.text);
                                    }
                                      emailController.text=text1;
                                      print(text1);
                                    }),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Don't have an account?",style: TextStyle(fontWeight: FontWeight.w700),),
                                        TextButton(
                                            onPressed: (){
                                              navigateAndFinish(context,RegisterScreen());
                                            },
                                            child: Text("Register".toUpperCase(),style:TextStyle(fontWeight: FontWeight.w900) ,))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Container(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );



        },

      ),
    );



  }



}
