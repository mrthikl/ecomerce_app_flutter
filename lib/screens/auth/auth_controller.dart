import 'package:ecommerce_app/resources/color.resource.dart';
import 'package:ecommerce_app/resources/style.resource.dart';
import 'package:ecommerce_app/screens/auth/signin/signin_screen.dart';
import 'package:ecommerce_app/screens/main/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      print("Login page");
      Get.offAll(() => SignInScreen());
    } else {
      Get.offAll(() => MainScreen(email: user.email));
    }
  }

  void register(String email, password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("About User", "User message",
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          titleText: "Account creation failed"
              .text
              .textStyle(MyStyle.typeSemiBold.copyWith(color: MyColor.white))
              .make(),
          messageText: e
              .toString()
              .text
              .textStyle(MyStyle.typeSemiBold.copyWith(color: MyColor.white))
              .make());
    }
  }

  void login(String email, password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("About Login", "Login message",
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          titleText: "Login failed"
              .text
              .textStyle(MyStyle.typeSemiBold.copyWith(color: MyColor.white))
              .make(),
          messageText: e
              .toString()
              .text
              .textStyle(MyStyle.typeSemiBold.copyWith(color: MyColor.white))
              .make());
    }
  }

  void logOut() async {
    await auth.signOut();
  }
}
