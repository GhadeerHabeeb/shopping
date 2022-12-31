import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/logics/controller/product_controller.dart';

class SearchFormText extends StatelessWidget {
    SearchFormText({Key? key}) : super(key: key);
  final controller=Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.searchTextController,
      onChanged: (searchName){
        controller.addSearchToList(searchName);
      },
      style: TextStyle(
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),

      keyboardType: TextInputType.text,
      cursorColor: Get.isDarkMode?Colors.pink:Colors.green,
      decoration:InputDecoration(
        suffixIcon:controller.searchTextController.text.isNotEmpty?
        IconButton(
            onPressed:(){
              controller.ClearSearch();
            },
            icon:Icon(
              Icons.close_rounded,
              color: Colors.grey,)):null,
        fillColor: Colors.white,
        focusColor: Colors.red,
        prefixIcon: Icon(Icons.search,color: Colors.grey,),
        hintText: 'Search What are you looking for',
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
     filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(20),
        ),
       focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(20),
        ),
      ) ,
    );
  }
}
