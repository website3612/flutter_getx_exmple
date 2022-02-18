import 'dart:core';
import 'package:flutter_getx_exmple/models/cart_item.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  Map<int, CartItem> _items = {};

  Map<int, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    // return  _items?.length?? 0;
    return _items.length;
  }

  bool isCart(int id) {
    return _items.containsKey(id);
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.productPrice * cartItem.productQuantity;
    });
    return total;
  }

  void addItem(int productId, double price, String title, int quantity) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
                productPrice: existingCartItem.productPrice,
                id: existingCartItem.id,
                productTitle: existingCartItem.productTitle,
                productQuantity: existingCartItem.productQuantity + 1,
              ));
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          productTitle: title,
          productPrice: price,
          productQuantity: 1,
        ),
      );
    }
    update();
  }

  void removeitem(int productId) {
    _items.remove(productId);
    update();
  }

  void clear() {
    _items = {};
    update();
  }
}
