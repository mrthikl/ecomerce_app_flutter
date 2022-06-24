import 'package:ecommerce_app/@share/widget/input/text_field_container.dart';
import 'package:ecommerce_app/resources/color.resource.dart';
import 'package:flutter/material.dart';

class RoundedPassword extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  const RoundedPassword({
    Key? key,
    required this.onChanged,
    required this.controller,
  }) : super(key: key);

  @override
  State<RoundedPassword> createState() => _RoundedPasswordState();
}

class _RoundedPasswordState extends State<RoundedPassword> {
  bool _passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      obscureText: _passwordVisible,
      decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: MyColor.kPrimaryColor,
          ),
          suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
              child: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: MyColor.kPrimaryColor,
              )),
          border: InputBorder.none),
    ));
  }
}
