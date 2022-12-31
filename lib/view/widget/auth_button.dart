import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/view/widget/text_utils.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const AuthButton({
    required this.text,
    required this.onPressed,

    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 35),
          primary:Get.isDarkMode?Colors.pink:Colors.green,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          padding:EdgeInsets.symmetric(horizontal: 30,vertical: 12)
      ),
      onPressed:onPressed,
      child:MyText(text: text,fontSize:18 ,fontWeight: FontWeight.bold,color: Colors.white,) ,);
  }
}
