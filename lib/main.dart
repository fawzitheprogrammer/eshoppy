import 'package:eshoppy/data/cart_list.dart';
import 'package:eshoppy/screens/cart_screen.dart';
import 'package:eshoppy/screens/home_screen.dart';
import 'package:eshoppy/screens/search_screen.dart';
import 'package:eshoppy/screens/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'data/bottom_navbar_provider.dart';
import 'helpers/helper_imports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider(
          create: (context) =>  CartList(),
        ),
         
          ChangeNotifierProvider(
          create: (context) =>  BottomNavBar(),
        ),
       
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: SplashScreen()),
    );
  }
}

class MyMainScreens extends StatelessWidget {
  const MyMainScreens({super.key});

  @override
  Widget build(BuildContext context) {
    int currentIndex =
        Provider.of<BottomNavBar>(context, listen: true).currentIndex;
    final provider = Provider.of<BottomNavBar>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: provider.pageController,
          onPageChanged: ((value) {
            provider.bottomNavIndex(value);
          }),
          children: const [HomeScreen(), SearchScreen(), CartScreen()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          provider.bottomNavIndex(value);
          provider.animateToPage(provider.pageController);
        },
        currentIndex: currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: iconAndActiveTextColor,
        unselectedItemColor: iconAndInactiveTextColor,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: "",
            icon: SvgPicture.asset(
              'assets/icons/home_outlined.svg',
              width: 24,
              height: 24,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/home_filled.svg',
              width: 24,
              height: 24,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: SvgPicture.asset(
              'assets/icons/search.svg',
              width: 24,
              height: 24,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/search_filled.svg',
              width: 24,
              height: 24,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: SvgPicture.asset(
              'assets/icons/shopping-basket.svg',
              width: 25,
              height: 25,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/shopping-basket-filled.svg',
              width: 24,
              height: 24,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: SvgPicture.asset(
              'assets/icons/heart_outlined.svg',
              width: 24,
              height: 24,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/heart_filled.svg',
              width: 24,
              height: 24,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: SvgPicture.asset(
              'assets/icons/user_outlined.svg',
              width: 24,
              height: 24,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/user_filled.svg',
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }
}
