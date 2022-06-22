import 'package:ecommerce_app/resources/color.resource.dart';
import 'package:ecommerce_app/resources/style.resource.dart';
import 'package:ecommerce_app/screens/main/detail/detail_screen.dart';
import 'package:ecommerce_app/screens/main/home/home_controller.dart';
import 'package:ecommerce_app/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var controller = Get.put(HomeController());
  final String bucketOffsetKey = 'thisPageOffsetKey';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification pos) {
        if (pos is ScrollEndNotification) {
          saveScrollOffset(context, pos.metrics.pixels, bucketOffsetKey);
          // print(currentPageScrollOffset(context, bucketOffsetKey));
        }
        return true;
      },
      child: VxBox(
        child: CustomScrollView(
            controller: ScrollController(
                initialScrollOffset:
                    currentPageScrollOffset(context, bucketOffsetKey)),
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  expandedHeight: size.height * 0.65,
                  flexibleSpace: Stack(
                    children: [
                      const Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Image(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://cdn.dribbble.com/users/6700208/screenshots/17528136/media/be93f16c511e73bb86a742e4f3accfbf.png?compress=1&resize=1000x750&vertical=top",
                            ),
                          )),
                      Positioned(
                        bottom: -1,
                        left: 0,
                        right: 0,
                        child: VxBox()
                            .height(30)
                            .withDecoration(BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 8),
                                    blurRadius: 12,
                                    color:
                                        MyColor.kPrimaryColor.withOpacity(0.8))
                              ],
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(50),
                              ),
                            ))
                            .make(),
                      ),
                    ],
                  )),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) => VStack([
                            _newPro(),
                            56.h.heightBox,
                            _banner(),
                          ]),
                      childCount: 1))
            ]),
      ).make(),
    );
  }

  Widget _banner() => VxBox(
        child: Stack(
          children: [
            PageView.builder(
                controller: controller.controllerBanner,
                itemCount: controller.urlImageItemBanner.length,
                itemBuilder: (_, index) => Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              controller.urlImageItemBanner[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
            Positioned(
                bottom: 30.h,
                right: 30.w,
                child: SmoothPageIndicator(
                  controller: controller.controllerBanner,
                  count: controller.urlImageItemBanner.length,
                  effect: WormEffect(
                    dotColor: Colors.white.withOpacity(0.5),
                    activeDotColor: Colors.white,
                  ),
                )),
            Positioned(
              left: 20.w,
              top: 50.h,
              child: VStack(
                [
                  "Just for you"
                      .text
                      .textStyle(GoogleFonts.raleway()
                          .copyWith(fontSize: 32.sp, color: Colors.white))
                      .make(),
                  56.h.heightBox,
                  "Ecommerce "
                      .text
                      .textStyle(MyStyle.typeBold.copyWith(
                          fontSize: 56.sp,
                          color: Colors.white,
                          letterSpacing: 5))
                      .make(),
                  32.h.heightBox,
                  "App"
                      .text
                      .textStyle(GoogleFonts.raleway()
                          .copyWith(fontSize: 32.sp, color: Colors.white))
                      .make()
                ],
              ),
            )
          ],
        ),
      )
          .width(double.infinity)
          .height(MediaQuery.of(context).size.height * 0.65)
          .make();

  Widget _newPro() => VxBox(
        child: VStack(
          [
            "New Arrivals"
                .text
                .textStyle(MyStyle.typeBold.copyWith(fontSize: 24.sp))
                .make()
                .box
                .make()
                .marginOnly(
                  left: 24.w,
                  bottom: 12.h,
                ),
            VxBox(
                child: ListView.builder(
                    controller: controller.controllerNewPro,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.itemsCardInfo.length,
                    itemBuilder: (context, index) => VxBox(
                                child: VStack([
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                          item: controller
                                              .itemsCardInfo[index])));
                            },
                            child: Hero(
                              transitionOnUserGestures: true,
                              tag: controller.itemsCardInfo[index],
                              child: VxBox()
                                  .width(300.w)
                                  .height(300.h)
                                  .withDecoration(BoxDecoration(
                                    borderRadius: BorderRadius.circular(24.w),
                                    image: DecorationImage(
                                        image: NetworkImage(controller
                                            .itemsCardInfo[index].urlImage),
                                        fit: BoxFit.cover),
                                  ))
                                  .make()
                                  .marginOnly(bottom: 16.h),
                            ),
                          ),
                          HStack(
                            [
                              VStack([
                                controller.itemsCardInfo[index].title
                                    .toString()
                                    .text
                                    .textStyle(MyStyle.typeSemiBold)
                                    .make(),
                                5.h.heightBox,
                                RichText(
                                    text: TextSpan(children: [
                                  WidgetSpan(
                                      child: Padding(
                                    padding: EdgeInsets.only(right: 5.w),
                                    child: '\$'
                                        .text
                                        .textStyle(MyStyle.typeBold)
                                        .make(),
                                  )),
                                  TextSpan(
                                      text:
                                          controller.itemsCardInfo[index].price,
                                      style: MyStyle.typeBold
                                          .copyWith(fontSize: 20.sp))
                                ]))
                              ]),
                              Spacer(),
                              VxBox(
                                      child: IconButton(
                                          color: MyColor.white,
                                          onPressed: () {},
                                          icon: Icon(
                                              Icons.shopping_bag_outlined)))
                                  .withDecoration(BoxDecoration(
                                      color: MyColor.kPrimaryColor
                                          .withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(50)))
                                  .make()
                            ],
                          )
                        ]))
                            .padding(EdgeInsets.all(12.w))
                            .margin(EdgeInsets.only(left: 24.w, bottom: 20.h))
                            .withDecoration(BoxDecoration(
                                color: MyColor.white,
                                borderRadius: BorderRadius.circular(16.w),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 3),
                                      blurRadius: 12,
                                      color: MyColor.kPrimaryColor
                                          .withOpacity(0.3))
                                ]))
                            .width(300.w)
                            .height(400.h)
                            .make())).height(380).make().marginOnly(
                bottom: 12.h),
          ],
        ),
      ).make();
}
