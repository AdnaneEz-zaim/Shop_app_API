import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_button/group_button.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:shop_app_api/layout/Cubit/CubitHome.dart';
import 'package:shop_app_api/layout/Cubit/StatesHome.dart';
import 'package:shop_app_api/shared/Colors/Colors.dart';
import 'package:shop_app_api/shared/Consts/InformationsNetWork.dart';
import 'package:shop_app_api/shared/components/CategoryItemNoUTILISABLE.dart';
import 'package:shop_app_api/shared/components/ListCategiries.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //MyCarouselSlider(),
              Padding(
                padding: const EdgeInsets.only(left: 16.0,right: 16,top: 5),
                child: Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                   color: MyBlueBg,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 8,
                        blurRadius: 10,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage("assets/images/cadeau.png",),height: 60,width: 60,),
                      SizedBox(width: 5,),
                      Text("Surprise discount: ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20),),
                      Text("-20 % ",style: TextStyle(color: Colors.red,fontSize: 28),)
                    ],
                  ),
                ),
              ),
              // Container(
              //   height: 120,
              //   child: ListView.separated(
              //     physics: BouncingScrollPhysics(),
              //     scrollDirection: Axis.horizontal,
              //       itemBuilder: (context,index)=>CategoryItem(categories[index]),
              //       separatorBuilder: (context,index)=>Container(),
              //       itemCount: categories.length),
              // ),
        // MaterialSegmentedControl(
        // children: _children,
        // selectionIndex: _currentSelection,
        // borderColor: Colors.grey,
        // selectedColor: Colors.redAccent,
        // unselectedColor: Colors.white,
        // borderRadius: 32.0,
        // disabledChildren: [
        // 3,
        // ],
        //   onSegmentChosen: (index){
        //
        //   },
        //
        // ),
              MyListCategoriesWidget(categories),
         Padding(
           padding: const EdgeInsets.only(left: 12),
           child: Text("List Products",style: TextStyle(fontSize: 20,color: MyGreyText,fontWeight: FontWeight.w500),),
         ),
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
