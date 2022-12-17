import 'package:eshoppy/data/cart_list.dart';
import 'package:eshoppy/helpers/helper_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  bool showButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBg(context),
      appBar: AppBar(
        backgroundColor: scaffoldBg(context),
        title: Text(
          'Favourite',
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
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Favourite Screen',
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
            'This is favourite screen',
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
    );
  }
}
