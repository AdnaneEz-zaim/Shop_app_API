import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_api/modules/Login/LoginScreen.dart';
import 'package:shop_app_api/shared/Colors/Colors.dart';
import 'package:shop_app_api/shared/components/MyButton.dart';
import 'package:shop_app_api/shared/components/MyTextField.dart';
import 'package:shop_app_api/shared/functions/navigationFunctions.dart';

import 'Cubit/CubitRegister.dart';
import 'Cubit/StatesRegister.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var emailController =TextEditingController();
    var passwordController =TextEditingController();
    var confPasswordController =TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit,StatesRegister>(
        listener: (context,state){
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
                                          return "il faut rempliare le champs d'email";
                                        }
                                        return null;
                                      },
                                          (value){

                                      },
                                      "Email",
                                      Icons.email_outlined,
                                      false
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
                                      !RegisterCubit.get(context).visiblepassword,
                                      suffixIcon: RegisterCubit.get(context).visiblepassword?Icons.visibility_outlined:Icons.visibility_off_outlined,
                                      onPressedIcon: (){
                                        RegisterCubit.get(context).ChangeIconPassword();
                                      }
                                  ),
                                  SizedBox(height: 10,),
                                  MyTextField(
                                      confPasswordController,
                                      TextInputType.visiblePassword,
                                          (value){
                                        if(value!.isEmpty){
                                          return "il faut rempliare le champs de mot de pass";
                                        }
                                        return null;
                                      },
                                          (value){

                                      },
                                      "Confirmation de mot de pass",
                                      Icons.lock_outline_rounded,
                                      !RegisterCubit.get(context).visibleConPassword,
                                      suffixIcon: RegisterCubit.get(context).visibleConPassword?Icons.visibility_outlined:Icons.visibility_off_outlined,
                                      onPressedIcon: (){
                                        RegisterCubit.get(context).ChangeIconConfirmePassword();
                                      }
                                  ),
                                  SizedBox(height: 60,),
                                  MyButton("Register",(){}),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 30),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("You have an account?",style: TextStyle(fontWeight: FontWeight.w700),),
                                        TextButton(
                                            onPressed: (){
                                              navigateAndFinish(context,LogingScreen());
                                            },
                                            child: Text("Login".toUpperCase(),style:TextStyle(fontWeight: FontWeight.w900) ,))
                                      ],
                                    ),
                                  )
                                ],
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
