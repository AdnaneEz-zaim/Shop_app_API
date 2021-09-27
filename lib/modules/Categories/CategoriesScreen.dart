import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_api/shared/Consts/InformationsNetWork.dart';
import 'package:shop_app_api/shared/components/CategoryItem.dart';
import 'package:smart_grid_view/smart_grid_view.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
           return Padding(
             padding: const EdgeInsets.all(8.0),
             child: SmartGridView(
                 tileWidth: 160,
                 tileHeight: 287,
                 semanticChildCount: 2,
                 children: List.generate(categories.length, (index) => CategoryItem(index),
                 )
             ),
           );
  }
}

/*hadi ta nxof fin ndirna dyra b7al t9ssima dya instagrame*/

//   StaggeredGridView.countBuilder(
//   crossAxisCount: 4,
//   itemCount: 15,
//
//   itemBuilder: (BuildContext context, int index) => new Container(
//       color: Colors.green,
//       child: new Center(
//         child: new CircleAvatar(
//           backgroundColor: Colors.white,
//           child: new Text('$index'),
//         ),
//       )),
//   staggeredTileBuilder: (int index) =>
//   new StaggeredTile.count(2, index.isEven ? 2 : 1),
//   mainAxisSpacing: 4.0,
//   crossAxisSpacing: 4.0,
//);


//hadi li sta3malt

// return Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: SmartGridView(
//       tileWidth: 160,
//       tileHeight: 370,
//       semanticChildCount: 2,
//       children: List.generate(categories.length, (index) =>
//           Card(
//
//     child: GridTile(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Icon(Icons.eleven_mp,color: MyBlueBg,),
//             Text('${categories[index].name}',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
//           ],
//         ),
//       ),
//     ),
//
//   ),
//       )
//   ),
// );