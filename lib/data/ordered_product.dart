import 'package:flutter/material.dart';

class OrderedProduct {
  final String productName;
  final String imgUrl;
  final double price;
  final int productSize;
  final Color color;

  OrderedProduct({
    required this.productName,
    required this.imgUrl,
    required this.price,
    required this.productSize,
    required this.color,
  });
}
