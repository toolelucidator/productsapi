import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:productsapi/screens/product_card.dart';

import '../controllers/product_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Api REST TEST',
                    style: TextStyle(
                        fontFamily: 'avenir',
                        fontSize: 32,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.view_list_rounded),
                    onPressed: () {
                      productController.isGrid.value = false;
                    }),
                IconButton(
                    icon: Icon(Icons.grid_view),
                    onPressed: () {
                      productController.isGrid.value = true;
                    }),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (productController.isLoading.value)
                return Center(child: CircularProgressIndicator());
              else {
                return productController.isGrid.value
                    ? MasonryGridView.count(
                        itemCount: productController.productList.length,
                        crossAxisCount: 2,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                        itemBuilder: (context, index) {
                          return ProductCard(
                              productController.productList[index]);
                        })
                    : ListView.builder(
                        itemCount: productController.productList.length,
                        itemBuilder: (context, index) {
                          return ProductCard(
                              productController.productList[index]);
                        },
                      );
              }
            }),
          )
        ],
      ),
    );
  }
}
