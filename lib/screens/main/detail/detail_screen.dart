import 'dart:ui';

import 'package:ecommerce_app/@share/widget/animation/fadein_animation.dart';
import 'package:ecommerce_app/@share/widget/box/item_card.dart';
import 'package:ecommerce_app/resources/color.resource.dart';
import 'package:ecommerce_app/resources/style.resource.dart';
import 'package:ecommerce_app/screens/main/home/home_controller.dart';
import 'package:ecommerce_app/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailScreen extends StatelessWidget {
  final CardItem item;

  const DetailScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Hero(
      transitionOnUserGestures: true,
      tag: item,
      child: Stack(
        children: [
          VxBox()
              .width(double.infinity)
              .height(double.infinity)
              .withDecoration(
                BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(item.urlImage),
                    fit: BoxFit.cover,
                  ),
                ),
              )
              .make(),
          Positioned(
              width: size.width,
              bottom: 40.h,
              child: VxBox(
                      child: VStack([
                FadeinAnimation(
                  delay: 200,
                  from: 10,
                  child: "Yokai Boyz Kimono Navy"
                      .text
                      .textStyle(MyStyle.typeBold
                          .copyWith(fontSize: 20.sp, color: MyColor.white))
                      .make(),
                ),
                20.h.heightBox,
                FadeinAnimation(
                  delay: 300,
                  from: 10,
                  child: HStack(
                    [
                      "Color"
                          .text
                          .textStyle(MyStyle.typeLight
                              .copyWith(fontSize: 16.sp, color: MyColor.white))
                          .make(),
                      Spacer(),
                      HStack([
                        _colorSelectBox(Colors.red),
                        5.w.widthBox,
                        _colorSelectBox(Colors.blue),
                        5.w.widthBox,
                        _colorSelectBox(Colors.green),
                      ])
                    ],
                    alignment: MainAxisAlignment.spaceBetween,
                  ),
                ),
                20.h.heightBox,
                FadeinAnimation(
                  delay: 400,
                  from: 10,
                  child: HStack(
                    [
                      "Size"
                          .text
                          .textStyle(MyStyle.typeLight
                              .copyWith(fontSize: 16.sp, color: MyColor.white))
                          .make(),
                      Spacer(),
                      HStack([
                        _sizeSelectBox("XS"),
                        5.w.widthBox,
                        _sizeSelectBox("S"),
                        5.w.widthBox,
                        _sizeSelectBox("M"),
                        5.w.widthBox,
                        _sizeSelectBox("L"),
                        5.w.widthBox,
                        _sizeSelectBox("XL"),
                      ])
                    ],
                    alignment: MainAxisAlignment.spaceBetween,
                  ),
                ),
                30.h.heightBox,
                _divider(),
                30.h.heightBox,
                FadeinAnimation(
                  delay: 500,
                  from: 10,
                  child: HStack(
                    [
                      RichText(
                          text: TextSpan(children: [
                        WidgetSpan(
                            child: Padding(
                          padding: EdgeInsets.only(right: 5.w),
                          child: '\$'
                              .text
                              .textStyle(MyStyle.typeBold
                                  .copyWith(color: MyColor.white))
                              .make(),
                        )),
                        TextSpan(
                            text: "500",
                            style: MyStyle.typeBold.copyWith(
                                color: MyColor.white, fontSize: 36.sp))
                      ])),
                      Spacer(),
                      _addToCartButton()
                    ],
                    alignment: MainAxisAlignment.spaceBetween,
                  ),
                ),
              ]))
                  .withDecoration(BoxDecoration(
                      color: MyColor.black.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(24.r)))
                  .padding(EdgeInsets.all(24.w))
                  .make()
                  .paddingOnly(left: 24.w, right: 24.w)),
        ],
      ),
    ));
  }

  Widget _colorSelectBox(Color color) => VxBox()
      .withDecoration(BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50.r),
          border: Border.all(width: 2, color: MyColor.white)))
      .width(22)
      .height(22)
      .make();
  Widget _sizeSelectBox(String size) => VxBox(
          child: size.text
              .textStyle(MyStyle.typeMedium
                  .copyWith(fontSize: 10.sp, color: MyColor.white))
              .makeCentered())
      .withDecoration(BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          border:
              Border.all(width: 0.5, color: MyColor.white.withOpacity(0.5))))
      .width(24)
      .height(24)
      .make();
  Widget _divider() => VxBox()
      .color(MyColor.white.withOpacity(0.3))
      .width(double.infinity)
      .height(0.5)
      .make();

  Widget _addToCartButton() => TextButton(
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 24.w)),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
      onPressed: () {},
      child: "Add to Cart"
          .text
          .textStyle(MyStyle.typeBold
              .copyWith(fontSize: 16.sp, color: MyColor.kPrimaryColor))
          .make());
}
