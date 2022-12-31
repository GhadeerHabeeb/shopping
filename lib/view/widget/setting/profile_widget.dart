import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/logics/controller/setting_controller.dart';
import 'package:untitled/view/widget/text_utils.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({Key? key}) : super(key: key);
  final controller=Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage('https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',),
              fit: BoxFit.cover,
            )
          ),

        ),
        SizedBox(
          width: 15,
        ),
        Column(
          children: [
            MyText(fontWeight: FontWeight.bold,fontSize: 22,color: Get.isDarkMode?Colors.white:Colors.black,text:controller.capitalized('ghadeer habeeb')),
            SizedBox(
              height: 3,
            ),
            MyText(fontWeight: FontWeight.bold,fontSize: 15,color: Get.isDarkMode?Colors.white60:Colors.black38,text:'GhadeerHabeeb@gmail.com'),

          ],

        )
      ],
    );
  }
}
