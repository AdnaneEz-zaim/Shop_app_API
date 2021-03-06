import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_api/layout/Cubit/CubitHome.dart';
import 'package:shop_app_api/layout/Cubit/StatesHome.dart';
import 'package:shop_app_api/shared/Colors/Colors.dart';
import 'package:shop_app_api/shared/Consts/InformationsNetWork.dart';
import 'package:shop_app_api/shared/components/FavoriesItem.dart';

class FavoriesScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Center(child: Container(child:Text('Favories')));
  }
}

class MyHomePageState extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double heigthImage=170;

    return BlocConsumer<HomeCubit,StatesHomeScreen>(
      listener: (context,state){
      },
      builder: (context,state){
        return  favoritesModel==null?Center(child: CircularProgressIndicator(color: MyBlueBg,))
            :
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: ListView.separated(
              shrinkWrap: true,

              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context,index){
                return MyFavoriesItem(heigthImage: heigthImage,
                    widthScreen: width,
                    product: (favoritesModel?.data.data[index].product)!,
                    changeFavoriete: (){
                      HomeCubit.get(context).ChangeFavorite(favoritesModel?.data.data[index].product.id);
                    });
              },
              separatorBuilder: (context,index){ return Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[200],
              );},
              itemCount: (favoritesModel!=null?(favoritesModel?.data.data)?.length:0)!),
        );

      },

    );

      //(homeModel!=null?(homeModel?.data.products)?.length:0)!,)

    // Scaffold(
    //   body: ListView(
    //     physics: const BouncingScrollPhysics(),
    //     children: <Widget>[
    //
    //       Card2(),
    //
    //     ],
    //   ),
    // );
  }
}

const loremIpsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";



class Card2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {



    buildCollapsed3() {
      return Container(
        child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut"),
      );
    }

    /*hadi dyal dak tetre w dik descreption srira*/

    // buildExpanded1() {
    //   return Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: <Widget>[
    //         Padding(
    //           padding: EdgeInsets.all(10),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: <Widget>[
    //               Text(
    //                 "Expandable",
    //               ),
    //               Text(
    //                 "3 Expandable widgets",
    //                 style: Theme.of(context).textTheme.caption,
    //               ),
    //             ],
    //           ),
    //         ),
    //       ]);
    // }



    buildExpanded3() {
      return Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              loremIpsum,
              // softWrap: true,
            ),
          ],
        ),
      );
    }

    return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: ScrollOnExpand(
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  //hadi dyal titre w description
                  // Expandable(
                  //   collapsed: buildCollapsed1(),
                  //   expanded: buildExpanded1(),
                  // ),

                  Expandable(
                    collapsed: buildCollapsed3(),
                    expanded: buildExpanded3(),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Builder(
                        builder: (context) {
                          var controller =
                          ExpandableController.of(context, required: true)!;
                          return TextButton(
                            child: Text(
                              controller.expanded ? "fermer" : "Lire la suite",
                              style: Theme.of(context)
                                  .textTheme
                                  .button!
                                  .copyWith(color: MyGreyText),
                            ),
                            onPressed: () {
                              controller.toggle();
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

