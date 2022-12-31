import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/view/widget/text_utils.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final String TextType;
  final Function() onPressed;
  const ContainerUnder({
    required this.onPressed,
    required this.text,
    required this.TextType,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Get.isDarkMode?Colors.pink:Colors.green,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular( 20),
          topRight: Radius.circular( 20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyText(fontWeight: FontWeight.bold,
              fontSize: 20, text:text,
              color: Colors.white),
          TextButton(
              onPressed: onPressed,
              child:Text(TextType,style:TextStyle(fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
                decoration: TextDecoration.underline,


             ),

          ),

          ),
        ],
      ),
    );
  }
}
