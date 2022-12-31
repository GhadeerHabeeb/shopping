import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/view/widget/text_utils.dart';


class LogOutWidget extends StatelessWidget {
  const LogOutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Container(

          padding: EdgeInsets.all(6),
            decoration:BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
            child: Icon(Icons.logout,color: Colors.black38,)
        ),
        SizedBox(
          width: 20,
        ),
        MyText(fontWeight: FontWeight.bold, fontSize: 22, text: 'LogOut'.tr, color: Get.isDarkMode?Colors.white:Colors.black)
      ],
    );
  }
}
