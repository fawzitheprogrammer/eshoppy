import 'package:flutter/material.dart';

class Product {
  final String productName;
  final String description;
  final String imgUrl;
  final double productNewPrice;
  final double productOldPrice;
  final List<Color> productColors;
  final List<int> productSize;

  Product({
    required this.productName,
    required this.description,
    required this.imgUrl,
    required this.productNewPrice,
    required this.productOldPrice,
    required this.productColors,
    required this.productSize,
  });
}
