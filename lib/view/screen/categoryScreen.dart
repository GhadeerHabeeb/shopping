import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:untitled/view/widget/category/category_widget.dart';
import 'package:untitled/view/widget/text_utils.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:context.theme.backgroundColor,
       body:Padding(padding:EdgeInsets.only(left: 15,top: 15),
       child: Column(
           children: [
             Align(
               alignment: Alignment.topLeft,
               child: Padding(
                 padding: EdgeInsets.only(left: 15,top: 15),
                 child:MyText(fontWeight: FontWeight.bold,fontSize: 30,color: Get.isDarkMode?Colors.white:Colors.black,text: 'Category',),
               ),

       ),
             SizedBox(
               height: 20,
             ),
             CategoryWidget(),
         ],
       ),


       ),
    );
  }
}