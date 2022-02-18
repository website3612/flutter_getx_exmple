import 'package:flutter/material.dart';
import 'package:flutter_getx_exmple/screens/order_screen.dart';
import 'package:flutter_getx_exmple/screens/product_overview_screen.dart';
import 'package:get/get.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text("Hello Friend"),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text("Shop"),
            onTap: () {
              Get.to(() => ProductOverviewPage());
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text("Orders"),
            onTap: () {
              Get.to(() => OrderScreen());
            },
          ),
        ],
      ),
    );
  }
}
