import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/view/widget/home/card_item.dart';
import 'package:untitled/view/widget/text_utils.dart';
import 'package:animate_do/animate_do.dart';

import '../widget/home/search_text_form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:context.theme.backgroundColor,
      body:Column(

        children: [
          ElasticInDown(
            child: Container(
             width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: Get.isDarkMode?Colors.black:Colors.green,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(fontWeight: FontWeight.bold, fontSize: 22, text: 'Find Your ', color: Colors.white),
                    SizedBox(
                      height: 5,
                    ),
                    MyText(fontWeight: FontWeight.bold, fontSize: 28, text:  ' INSPIRATION', color: Colors.white),
                    SizedBox(
                      height: 20,
                    ),
                    SearchFormText(),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: MyText(fontWeight: FontWeight.w500,
                  fontSize: 20,
                  text: 'Categories',
                  color:Get.isDarkMode?Colors.white:Colors.black),
            ),
          ),
          SizedBox(
            height: 30,
          ),
           CardItems(),
        ],
      ),

    );

  }
}
