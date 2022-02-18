import 'package:flutter/material.dart';
import 'package:flutter_getx_exmple/get_controller/cart_controller.dart';
import 'package:flutter_getx_exmple/widget/app_drawer.dart';
import 'package:flutter_getx_exmple/widget/productgrid.dart';
import 'package:get/get.dart';

import 'cart_screen.dart';

class ProductOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());

    return Scaffold(
      appBar: AppBar(
        title: Text("My Shop"),
        actions: <Widget>[
          GetBuilder<CartController>(
              init: CartController(),
              builder: (contex) {
                return IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                    ),
                    onPressed: () {
                      Get.to(() => CartScreen());
                    });
              })
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(),
    );
  }
}
