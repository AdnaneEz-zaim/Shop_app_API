import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_api/layout/Cubit/CubitHome.dart';
import 'package:shop_app_api/layout/Cubit/StatesHome.dart';
import 'package:shop_app_api/shared/Colors/Colors.dart';
import 'package:shop_app_api/shared/Consts/InformationsNetWork.dart';
import 'package:shop_app_api/shared/components/MyCarouselSlider.dart';
import 'package:shop_app_api/shared/components/ProductItem.dart';




class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,StatesHomeScreen>(
      listener: (context,state){
      },
      builder: (context,state){
        return  homeModel==null?Center(child: CircularProgressIndicator(color: MyBlueBg,))
            :
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              MyCarouselSlider(),
          SizedBox(height: 5,),
          ListView.separated(
            shrinkWrap: true,

          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context,index){
          return MyProductItem(products[index]);
          },
          separatorBuilder: (context,index){ return Container(
          width: double.infinity,
          height: 1,
          color: Colors.grey[200],
          );},
          itemCount: (homeModel!=null?(homeModel?.data.products)?.length:0)!,)
            ],
          ),
        );

      },

    );



  }
}
