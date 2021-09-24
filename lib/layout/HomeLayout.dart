import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_api/shared/Consts/PagesPrincipale.dart';

import 'Cubit/CubitHome.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listScreens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index){
          HomeCubit.get(context).ChangeCurrentIndex(index);
        },
        items: listeNavigationBar,
      ),
    );
  }
}
