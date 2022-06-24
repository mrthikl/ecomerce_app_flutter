import 'package:ecommerce_app/@share/widget/animation/fadein_animation.dart';
import 'package:ecommerce_app/@share/widget/button/rounded_button.dart';
import 'package:ecommerce_app/@share/widget/custom/check_account.dart';
import 'package:ecommerce_app/@share/widget/input/round_input_password.dart';
import 'package:ecommerce_app/@share/widget/input/rounded_input_field.dart';
import 'package:ecommerce_app/@share/widget/scaffold/custom_caffold.dart';
import 'package:ecommerce_app/resources/color.resource.dart';
import 'package:ecommerce_app/resources/image.resource.dart';
import 'package:ecommerce_app/resources/style.resource.dart';
import 'package:ecommerce_app/screens/auth/auth_controller.dart';
import 'package:ecommerce_app/screens/auth/signin/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final Size size = MediaQuery.of(context).size;
    return CustomScaffold(
      backgroundAuth: true,
      child: VStack(
        [
          FadeinAnimation(
            delay: 200,
            child: Text(
              "Login".toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          20.h.heightBox,
          FadeinAnimation(
            delay: 300,
            child: SvgPicture.asset(
              MyImage.chat,
              height: size.height * 0.35,
            ),
          ),
          20.h.heightBox,
          FadeinAnimation(
            delay: 400,
            child: RoundedInputField(
              onChanged: (value) {},
              icon: const Icon(Icons.person),
              hintText: "Email",
              controller: emailController,
            ),
          ),
          FadeinAnimation(
            delay: 500,
            child: RoundedPassword(
              onChanged: (value) {},
              controller: passwordController,
            ),
          ),
          10.h.heightBox,
          FadeinAnimation(
            delay: 600,
            child: RoundedButton(
                color: MyColor.kPrimaryColor,
                text: "Sign Up".toUpperCase(),
                onPressed: () {
                  AuthController.instance.register(emailController.text.trim(),
                      passwordController.text.trim());
                }),
          ),
          20.h.heightBox,
          FadeinAnimation(
            delay: 700,
            child: AlreadyHaveAnAccountCheck(
              login: false,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInScreen()));
              },
            ),
          )
        ],
        crossAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
