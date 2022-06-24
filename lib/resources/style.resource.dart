import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color.resource.dart';

class MyStyle {
  static TextStyle typeLight = TextStyle(
      fontSize: 14.sp, color: MyColor.black, fontWeight: FontWeight.normal);

  static TextStyle typeRegular = TextStyle(
      fontSize: 14.sp, color: MyColor.black, fontWeight: FontWeight.w300);

  static TextStyle typeMedium = TextStyle(
      fontSize: 14.sp, color: MyColor.black, fontWeight: FontWeight.w400);

  static TextStyle typeBold = TextStyle(
      fontSize: 14.sp, color: MyColor.black, fontWeight: FontWeight.w700);

  static TextStyle typeSemiBold = TextStyle(
      fontSize: 14.sp, color: MyColor.black, fontWeight: FontWeight.w600);
}
