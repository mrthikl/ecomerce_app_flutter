import 'package:animations/animations.dart';
import 'package:ecommerce_app/resources/color.resource.dart';
import 'package:ecommerce_app/screens/main/cart/cart_screen.dart';
import 'package:ecommerce_app/screens/main/detail/detail_screen.dart';
import 'package:ecommerce_app/screens/main/home/home_screen.dart';
import 'package:ecommerce_app/screens/main/profile/profile_screen.dart';
import 'package:ecommerce_app/screens/main/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final PageStorageBucket appBucket = PageStorageBucket();
saveScrollOffset(BuildContext context, double offset, String key) =>
    appBucket.writeState(context, offset, identifier: ValueKey(key));
double currentPageScrollOffset(BuildContext context, String key) =>
    appBucket.readState(context, identifier: ValueKey(key)) ?? 0.0;

class MainScreen extends StatefulWidget {
  String? email;
  MainScreen({Key? key, required this.email}) : super(key: key);

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
      body: PageStorage(
        bucket: appBucket,
        child: PageTransitionSwitcher(
          transitionBuilder: (
            child,
            primaryAnimation,
            secondaryAnimation,
          ) =>
              SharedAxisTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
            child: child,
          ),
          child: pageList[_currentIndex],
        ),
      ),
      bottomNavigationBar: SalomonBottomBar(
        margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
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
