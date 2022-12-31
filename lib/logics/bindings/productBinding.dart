

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/logics/controller/cart_controller.dart';
import 'package:untitled/logics/controller/category_controller.dart';
import 'package:untitled/logics/controller/product_controller.dart';


class ProductBindings extends Bindings{
@override
  void dependencies(){
    Get.put(ProductController());
    Get.lazyPut(() => CartController());
    Get.put(CategoryController());
  }

}