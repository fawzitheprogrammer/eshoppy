import 'package:eshoppy/data/cart_list.dart';
import 'package:eshoppy/data/ordered_product.dart';
import 'package:eshoppy/data/products_list.dart';
import 'package:eshoppy/helpers/helper_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({super.key, required this.product});

  final Product product;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            'assets/icons/angle-left.svg',
            height: 24,
            width: 24,
          ),
        ),
        backgroundColor: scaffoldBg(context),
        title: Text(
          'Product Detail',
          style: poppinsCustom(Colors.black87, 18),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SvgPicture.asset('assets/icons/heart_outlined.svg'))
        ],
        elevation: 0.0,
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        height: deviceScreenHeight(context) * 0.1,
        child: Row(
          children: [
            RichText(
              textScaleFactor: 1,
              text: TextSpan(
                text: widget.product.productNewPrice.toString(),
                style: poppinsCustom(Colors.black87, 24.0)
                    .copyWith(fontWeight: FontWeight.w800),
                children: [
                  const TextSpan(
                    text: ' ',
                  ),
                  TextSpan(
                    text: widget.product.productOldPrice.toString(),
                    style: poppinsCustom(Colors.grey, 18.0).copyWith(
                        decoration: TextDecoration.lineThrough,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            const Spacer(),
            roundedButton(
                onPressed: () {
                  Provider.of<CartList>(context, listen: false).insertProduct(
                    widget.product.productName,
                    widget.product.imgUrl,
                    widget.product.productNewPrice,
                    SizeChip.size ?? 0,
                    ColorChips.color ?? Colors.transparent,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.black87,
                      duration: const Duration(seconds: 1),
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text('Please check your cart for your items'),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  );
                  Navigator.pop(context);
                },
                text: 'Add to cart',
                width: deviceScreenWidth(context) * 0.5,
                height: deviceScreenHeight(context) * 0.08)
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.grey.shade100,
                ),
                height: deviceScreenHeight(context) * 0.35,
                width: deviceScreenWidth(context),
                child: Hero(
                  tag: widget.product.imgUrl,
                  child: Image.asset(
                    widget.product.imgUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Text(
                widget.product.productName,
                style: poppinsCustom(Colors.black.withOpacity(0.8), 20)
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.star_rounded,
                    color: Colors.amber,
                    size: 20,
                  ),
                  // Text(
                  //  ,
                  //   style: poppinsCustom(Colors.black, 14)
                  //       .copyWith(fontWeight: FontWeight.w700),
                  // ),
                  RichText(
                    text: TextSpan(
                      text: '4.7',
                      style: poppinsCustom(Colors.black, 14)
                          .copyWith(fontWeight: FontWeight.w700),
                      children: [
                        TextSpan(
                          text: ' (335)',
                          style: poppinsCustom(Colors.grey, 12)
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                        TextSpan(
                          text: '   212 reviews',
                          style: poppinsCustom(Colors.grey, 12)
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 22.0,
              ),
              ExpandableText(
                widget.product.description,
                expandText: 'Read more',
                collapseText: 'Read less',
                linkColor: Colors.blue,
                maxLines: 2,
                style: poppinsCustom(Colors.grey, 14)
                    .copyWith(fontWeight: FontWeight.w400),
                linkStyle: poppinsCustom(secondaryButtonColor, 12).copyWith(
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis),
              ),
              const SizedBox(
                height: 24.0,
              ),
              buildLabel(label: 'Select color', link: ''),
              ColorChips(
                productColors: widget.product.productColors,
              ),
              const SizedBox(
                height: 16.0,
              ),
              buildLabel(label: 'Select size', link: 'size guide'),
              const SizedBox(
                height: 4.0,
              ),
              SizedBox(
                width: deviceScreenWidth(context),
                child: SizeChip(
                  productSize: widget.product.productSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
