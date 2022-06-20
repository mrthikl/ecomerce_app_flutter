import 'package:ecommerce_app/resources/color.resource.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function() onTap;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Don't have an Account? " : "Already have an Account? ",
          style: TextStyle(color: MyColor.kPrimaryColor),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: TextStyle(
                color: MyColor.kPrimaryColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
