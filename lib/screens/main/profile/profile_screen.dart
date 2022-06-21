import 'package:ecommerce_app/resources/color.resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height,
      color: Colors.deepPurpleAccent,
      child: "Profile".text.color(Colors.white).makeCentered(),
    );
  }
}
