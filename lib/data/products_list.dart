import 'package:eshoppy/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductsList {
  List<Product> productsList = [
    Product(
      productName: 'Long Red Dress',
      description:
          'Lorem ipsum dolor sit amet. Ut velit nihil hic rerum nihil id ducimus iure vel culpa asperiores cum numquam enim.',
      imgUrl: 'assets/dress1.jpg',
      productNewPrice: 25.99,
      productOldPrice: 35.99,
      productColors: [
        Colors.red,
        Colors.blue,
        Colors.grey,
        Colors.pink,
        Colors.indigo,
      ],
      productSize: [
        34,
        36,
        38,
        40,
        42,
      ],
    ),
    Product(
      productName: 'Long Grey Dress',
      description:
          'Lorem ipsum dolor sit amet. Ut velit nihil hic rerum nihil id ducimus iure vel culpa asperiores cum numquam enim.',
      imgUrl: 'assets/dress2.jpg',
      productNewPrice: 25.99,
      productOldPrice: 35.99,
      productColors: [
        Colors.red,
        Colors.blue,
        Colors.grey,
        Colors.pink,
        Colors.indigo,
      ],
      productSize: [
        34,
        36,
        38,
        40,
        42,
      ],
    ),
    Product(
      productName: 'Drak Cyan Dress',
      description:
          'Lorem ipsum dolor sit amet. Ut velit nihil hic rerum nihil id ducimus iure vel culpa asperiores cum numquam enim.',
      imgUrl: 'assets/dress3.jpg',
      productNewPrice: 39.99,
      productOldPrice: 59.99,
      productColors: [
        Colors.blueAccent,
        Colors.cyan,
        Colors.grey,
        Colors.redAccent,
        Colors.indigo,
      ],
      productSize: [
        32,
        34,
        36,
        38,
        40,
        42,
      ],
    ),
    Product(
      productName: 'Black Jumper',
      description:
          'Lorem ipsum dolor sit amet. Ut velit nihil hic rerum nihil id ducimus iure vel culpa asperiores cum numquam enim.',
      imgUrl: 'assets/jumper1.jpg',
      productNewPrice: 15.99,
      productOldPrice: 25.99,
      productColors: [
        Colors.black,
        Colors.black12,
        Colors.amberAccent,
        Colors.redAccent,
        Colors.indigo,
      ],
      productSize: [
        28,
        30,
        32,
        34,
        38,
      ],
    ),
    Product(
      productName: 'Wide White Shirt',
      description:
          'Lorem ipsum dolor sit amet. Ut velit nihil hic rerum nihil id ducimus iure vel culpa asperiores cum numquam enim.',
      imgUrl: 'assets/shirt1.jpg',
      productNewPrice: 14.99,
      productOldPrice: 27.99,
      productColors: [
        Colors.white,
        Colors.redAccent,
        Colors.yellowAccent,
        Colors.blueAccent,
        Colors.indigo,
      ],
      productSize: [
        34,
        36,
        38,
        40,
        42,
      ],
    ),
    Product(
      productName: 'Black T-shirt',
      description:
          'Lorem ipsum dolor sit amet. Ut velit nihil hic rerum nihil id ducimus iure vel culpa asperiores cum numquam enim.',
      imgUrl: 'assets/tshirt3.jpg',
      productNewPrice: 12.99,
      productOldPrice: 24.99,
      productColors: [
        Colors.black,
        Colors.white,
        Colors.pinkAccent,
        Colors.greenAccent,
        Colors.indigo,
      ],
      productSize: [
        34,
        36,
        38,
        40,
        42,
      ],
    ),
    Product(
      productName: 'Black Skeleton T-shirt',
      description:
          'Lorem ipsum dolor sit amet. Ut velit nihil hic rerum nihil id ducimus iure vel culpa asperiores cum numquam enim.',
      imgUrl: 'assets/tshirt2.jpg',
      productNewPrice: 25.99,
      productOldPrice: 35.99,
      productColors: [
        Colors.black54,
        Colors.blue,
        Colors.pink,
        Colors.indigo,
      ],
      productSize: [
        34,
        36,
        38,
        40,
        42,
      ],
    ),
    Product(
      productName: 'White T-shirt',
      description:
          'Lorem ipsum dolor sit amet. Ut velit nihil hic rerum nihil id ducimus iure vel culpa asperiores cum numquam enim.',
      imgUrl: 'assets/tshirt1.jpg',
      productNewPrice: 25.99,
      productOldPrice: 35.99,
      productColors: [
        Colors.red,
        Colors.white,
        Colors.black,
        Colors.indigo,
      ],
      productSize: [
        34,
        36,
        38,
        40,
        42,
      ],
    ),
    Product(
      productName: 'Long Brown Coat',
      description:
          'Lorem ipsum dolor sit amet. Ut velit nihil hic rerum nihil id ducimus iure vel culpa asperiores cum numquam enim.',
      imgUrl: 'assets/coat1.jpg',
      productNewPrice: 45.99,
      productOldPrice: 75.99,
      productColors: [
        Colors.grey,
        Colors.blueGrey,
        const Color.fromARGB(255, 221, 90, 42),
        Colors.brown,
        Colors.black,
      ],
      productSize: [
        34,
        36,
        38,
        40,
        42,
      ],
    ),
    Product(
      productName: 'Long Blue Coat',
      description:
          'Lorem ipsum dolor sit amet. Ut velit nihil hic rerum nihil id ducimus iure vel culpa asperiores cum numquam enim.',
      imgUrl: 'assets/coat5.jpg',
      productNewPrice: 45.99,
      productOldPrice: 75.99,
      productColors: [
        Colors.grey,
        Colors.blueGrey,
        const Color.fromARGB(255, 221, 90, 42),
        Colors.brown,
        Colors.black,
      ],
      productSize: [
        34,
        36,
        38,
        40,
        42,
      ],
    ),
    Product(
      productName: 'Girly Coat',
      description:
          'Lorem ipsum dolor sit amet. Ut velit nihil hic rerum nihil id ducimus iure vel culpa asperiores cum numquam enim.',
      imgUrl: 'assets/coat4.jpg',
      productNewPrice: 34.99,
      productOldPrice: 45.99,
      productColors: [
        Colors.grey,
        Colors.blueGrey,
        const Color.fromARGB(255, 221, 90, 42),
        Colors.brown,
        Colors.black,
      ],
      productSize: [
        34,
        36,
        38,
        40,
        42,
      ],
    ),
    Product(
      productName: 'Long Blue Coat',
      description:
          'Lorem ipsum dolor sit amet. Ut velit nihil hic rerum nihil id ducimus iure vel culpa asperiores cum numquam enim.',
      imgUrl: 'assets/coat3.jpg',
      productNewPrice: 45.99,
      productOldPrice: 75.99,
      productColors: [
        Colors.grey,
        Colors.blueGrey,
        const Color.fromARGB(255, 221, 90, 42),
        Colors.brown,
        Colors.black,
      ],
      productSize: [
        34,
        36,
        38,
        40,
        42,
      ],
    ),
  ];
}
