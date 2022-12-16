import 'dart:collection';

import 'package:eshoppy/data/ordered_product.dart';
import 'package:flutter/material.dart';

class CartList extends ChangeNotifier {
  final List<OrderedProduct> cart = [];


  /// to get  users info ?? booking info
  UnmodifiableListView<OrderedProduct> get orderedItem {
    return UnmodifiableListView(cart);
  }

  void insertProduct(
      String productName, String imgUrl, double price, int size, Color color) {
    cart.add(OrderedProduct(
      productName: productName,
      imgUrl: imgUrl,
      price: price,
      productSize: size,
      color: color,
    ));
    notifyListeners();
  }

 
}
