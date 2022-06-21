import 'package:animations/animations.dart';
import 'package:ecommerce_app/@share/widget/animation/fade_animation.dart';
import 'package:ecommerce_app/resources/color.resource.dart';
import 'package:ecommerce_app/screens/main/cart/cart_screen.dart';
import 'package:ecommerce_app/screens/main/home/home_screen.dart';
import 'package:ecommerce_app/screens/main/profile/profile_screen.dart';
import 'package:ecommerce_app/screens/main/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  List<Widget> pageList = <Widget>[
    HomeScreen(),
    SearchScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: pageList[_currentIndex],
      body: PageTransitionSwitcher(
        transitionBuilder: (
          child,
          primaryAnimation,
          secondaryAnimation,
        ) =>
            SharedAxisTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.scaled,
          child: child,
        ),
        child: pageList[_currentIndex],
      ),
      bottomNavigationBar: SalomonBottomBar(
        margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: "Home".text.make(),
            selectedColor: MyColor.kPrimaryColor,
          ),
          SalomonBottomBarItem(
              icon: Icon(Icons.search),
              title: "Search".text.make(),
              selectedColor: MyColor.kPrimaryColor),
          SalomonBottomBarItem(
              icon: Icon(Icons.shopping_bag),
              title: "Cart".text.make(),
              selectedColor: MyColor.kPrimaryColor),
          SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: "Profile".text.make(),
              selectedColor: MyColor.kPrimaryColor),
        ],
      ),
    );
  }
}
