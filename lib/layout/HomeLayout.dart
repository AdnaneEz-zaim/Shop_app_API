import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_api/shared/Consts/GlobaleVariableHome.dart';

import 'Cubit/CubitHome.dart';
import 'Cubit/StatesHome.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit()..GetDataHome()..GetCategories(),
      child: BlocConsumer<HomeCubit,StatesHomeScreen>(
        listener: (context,state){
        },
        builder: (context,state){
          return  Scaffold(
            appBar: AppBar(
              title: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("JJ-Paris"),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.search_outlined)),
                ),
              ],
            ),
            body: listScreens[currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index){
                HomeCubit.get(context).ChangeCurrentIndex(index);
              },
              items: listeNavigationBar,
            ),
          );
        },

      ),
    );


  }
}
