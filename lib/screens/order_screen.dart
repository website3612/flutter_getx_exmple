import 'package:flutter/material.dart';
import 'package:flutter_getx_exmple/get_controller/order_controller.dart';
import 'package:flutter_getx_exmple/widget/app_drawer.dart';
import 'package:get/get.dart';

import 'order_item_screen.dart';

class OrderScreen extends StatelessWidget {
  var orderController = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yours Orders"),
      ),
      drawer: AppDrawer(),
      body: GetBuilder<OrderController>(
        builder: (orderController) {
          print(
              "orderController.orders.length ${orderController.orders.length}");
          return ListView.builder(
              itemCount: orderController.orders.length,
              itemBuilder: (context, index) =>
                  OrderItem(orderController.orders[index]));
        },
      ),
    );
  }
}
