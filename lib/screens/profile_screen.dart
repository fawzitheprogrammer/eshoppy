import 'package:eshoppy/data/cart_list.dart';
import 'package:eshoppy/helpers/helper_imports.dart';
import 'package:eshoppy/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool showButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBg(context),
      appBar: AppBar(
        backgroundColor: scaffoldBg(context),
        title: Text(
          'Profile Screen',
          style: poppinsCustom(Colors.black87, 18),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: ((context) => LoginPage())),
                  (route) => false);
            },
            icon: SvgPicture.asset('assets/icons/exit.svg'),
          )
        ],
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'This is profile screen',
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
            'You can find all your information here...',
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
