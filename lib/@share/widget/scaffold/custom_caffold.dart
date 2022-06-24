import 'package:ecommerce_app/resources/color.resource.dart';
import 'package:ecommerce_app/resources/image.resource.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomScaffold extends StatefulWidget {
  final Widget child;
  final bool backgroundAuth;
  final String imageAuthTop;
  final String imageAuthBottom;
  CustomScaffold({
    Key? key,
    required this.child,
    this.backgroundAuth = false,
    this.imageAuthTop = MyImage.main_top,
    this.imageAuthBottom = MyImage.main_bottom,
  }) : super(key: key);

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: widget.backgroundAuth
            ? Container(
                width: double.infinity,
                height: size.height,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Image.asset(widget.imageAuthTop)),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        child: Image.asset(widget.imageAuthBottom)),
                    SafeArea(
                      bottom: false,
                      top: false,
                      child: ListView(
                        padding: EdgeInsets.symmetric(vertical: 56.h),
                        shrinkWrap: true,
                        children: [widget.child],
                      ),
                    )
                  ],
                ),
              )
            : SafeArea(
                bottom: false,
                top: false,
                child: Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: widget.child,
                ),
              ));
  }
}
