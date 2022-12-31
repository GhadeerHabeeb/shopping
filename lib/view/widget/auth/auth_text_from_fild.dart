import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthTextFromFild extends StatelessWidget {
  final TextEditingController controller;
  final Function validation;
  final bool obscureText;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String hintText;
  AuthTextFromFild(
  {required this.hintText,
    required this.suffixIcon,
      required this.prefixIcon,
        required this.validation,
        required this.obscureText,
      required this.controller,Key? key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      validator:(value) =>validation(value),
      decoration: InputDecoration(
        fillColor:Colors.grey.shade200,
        prefixIcon:prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black45,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,

          ),
              borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder:OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,

          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,

          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,

          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ) ,

    );
  }
}
