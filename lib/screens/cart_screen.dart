import 'package:color_parser/color_parser.dart';
import 'package:eshoppy/data/cart_list.dart';
import 'package:eshoppy/helpers/helper_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool showButton = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<CartList>(builder: (context, value, child) {
      double subTotal = 0;

      for (int i = 0; i < value.cart.length; i++) {
        subTotal += value.cart[i].price;
      }

      return Scaffold(
        backgroundColor: scaffoldBg(context),
        appBar: AppBar(
          backgroundColor: scaffoldBg(context),
          title: Text(
            'Checkout',
            style: poppinsCustom(Colors.black87, 18),
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: SvgPicture.asset('assets/icons/menu-dots.svg'))
          ],
          elevation: 0.0,
          centerTitle: true,
        ),
        body: value.cart.isNotEmpty
            ? _buildCartCard()
            : Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your cart is empty!',
                    style: poppinsCustom(
                      Colors.black,
                      22,
                    ).copyWith(
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.0,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    'Buy something now and check again',
                    style: poppinsCustom(
                      Colors.black,
                      12,
                    ).copyWith(
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.0,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              )),
        bottomSheet: value.cart.isNotEmpty
            ? Container(
                color: scaffoldBg(context),
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                height: deviceScreenHeight(context) * 0.30,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: [
                          BillLabel(
                            label: 'Subtotal:',
                            price: subTotal,
                            fontSize: 14,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const BillLabel(
                            label: 'Delivery:',
                            price: 9.99,
                            fontSize: 14,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          BillLabel(
                            label: 'Total:',
                            price: (subTotal + 9.99),
                            fontSize: 18,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'You saved ',
                                style: poppinsCustom(
                                  Colors.grey,
                                  12,
                                ).copyWith(
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.0,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                r'$35.99',
                                style: poppinsCustom(
                                  Colors.blue,
                                  12,
                                ).copyWith(
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.0,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                '  with this purchase',
                                style: poppinsCustom(
                                  Colors.grey,
                                  12,
                                ).copyWith(
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.0,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          roundedButton(
                              onPressed: () {},
                              text: 'Checkout',
                              width: deviceScreenWidth(context),
                              height: deviceScreenHeight(context) * 0.08)
                        ],
                      ),
                    ),
                  ],
                ))
            : Container(
                height: 0.0,
              ),
      );
    });
  }

  Widget _buildCartCard() {
    return Consumer<CartList>(
      builder: (context, item, child) => ListView.builder(
        padding: EdgeInsets.only(bottom: deviceScreenHeight(context) * .3),
        scrollDirection: Axis.vertical,
        itemCount: item.cart.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: SizedBox(
              width: deviceScreenWidth(context),
              child: Row(
                children: [
                  LimitedBox(
                    maxWidth: deviceScreenWidth(context) * 0.5,
                    maxHeight: deviceScreenWidth(context) * 0.25,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image(
                        image: AssetImage(
                          item.cart[index].imgUrl,
                        ),
                        width: deviceScreenWidth(context) * 0.23,
                        height: deviceScreenWidth(context) * 0.25,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.cart[index].productName,
                            style: poppinsCustom(
                              Colors.black87,
                              16.0,
                            ).copyWith(
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.0,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  'Size : ${item.cart[index].productSize}',
                                  style: poppinsCustom(
                                    Colors.grey,
                                    12.0,
                                  ).copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.circle,
                                size: 4,
                                color: Colors.grey,
                              ),
                              Text(
                                'Color : ${ColorParser.color(item.cart[index].color).toName()}',
                                style: poppinsCustom(
                                  Colors.grey,
                                  12.0,
                                ).copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: TextSpan(
                              text: r'$',
                              style: poppinsCustom(
                                Colors.black38,
                                12,
                              ).copyWith(
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.0,
                                overflow: TextOverflow.ellipsis,
                              ),
                              children: [
                                TextSpan(
                                  text: item.cart[index].price.toString(),
                                  style: poppinsCustom(
                                    Colors.black87,
                                    16,
                                  ).copyWith(
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1.0,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  LimitedBox(
                    maxWidth: deviceScreenWidth(context) * 0.3,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2, color: Colors.black.withOpacity(0.05)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 45,
                      width: deviceScreenWidth(context) * 0.2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                '−',
                                style: poppinsCustom(Colors.grey, 16)
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                            ),
                            Text(
                              '1',
                              style: poppinsCustom(
                                Colors.black87,
                                16,
                              ).copyWith(
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                '+',
                                style: poppinsCustom(Colors.blue, 16)
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class BillLabel extends StatelessWidget {
  const BillLabel({
    Key? key,
    required this.label,
    required this.price,
    required this.fontSize,
  }) : super(key: key);

  final String label;
  final double price;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: poppinsCustom(
            Colors.grey,
            fontSize,
          ).copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: 1.0,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          '\$${price.toStringAsFixed(2)}',
          style: poppinsCustom(
            Colors.black87,
            fontSize,
          ).copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: 1.0,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
