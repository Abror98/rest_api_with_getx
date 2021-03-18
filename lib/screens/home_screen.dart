import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:rest_api_with_getx/contorellers/product_contorellers.dart';
import 'package:rest_api_with_getx/screens/product_item_screen.dart';

class HomeScreen extends StatelessWidget {
  final ProductContoreller productContoreller = Get.put(ProductContoreller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
        actions: [
          IconButton(icon: Icon(Icons.shopping_cart, color: Colors.black), onPressed: (){})
        ],
      ),
      body: Column(
        children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(child: Text("Shop", style: TextStyle(fontFamily: 'avenir', fontSize: 32, fontWeight: FontWeight.w900))),
                  IconButton(icon: Icon(Icons.view_list_rounded), onPressed: (){}),
                  IconButton(icon: Icon(Icons.grid_view), onPressed: (){})
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                if(productContoreller.isLoading.value)
                  return Center(child: SpinKitFadingCircle(color: Color.fromRGBO(18,108,193,1)));
                else
                return StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: productContoreller.productList.length,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    itemBuilder: (context, index) {
                      return ProductTile(productContoreller.productList[index]);
                    },
                    staggeredTileBuilder: (index) => StaggeredTile.fit(1));
              }
              ),
            )
        ],
      ),
    );
  }
}
