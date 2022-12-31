import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/model/products_models.dart';
import 'package:untitled/routes/route.dart';

 class CartController extends GetxController
 {
     var productsMap={}.obs;
     void addProductToCard(ProductsModel productsModel){
       if(productsMap.containsKey(productsModel)){
         productsMap[productsModel]+=1;


       }
       else{
         productsMap[productsModel]=1;

       }

     }
     void removeProductsFromCard(ProductsModel productsModel){
       if(productsMap.containsKey(productsModel)&&productsMap[productsModel]==1)
         {
            productsMap.removeWhere((key, value) => key==productsModel);

         }
       else
         {
            productsMap[productsModel]-=1;
         }








     }

     void removeOneProduct(ProductsModel productsModel)
     {
       productsMap.removeWhere((key, value) => key==productsModel);
     }

     void clearProduct()
     {
        Get.defaultDialog(
         title:'Clear Products',
         titleStyle: TextStyle(
           fontSize: 18,
           color: Colors.black,
           fontWeight: FontWeight.bold

         ),
         middleText: 'Are you sure you want to delete this products',
         middleTextStyle: TextStyle(
             fontSize: 18,
             color: Colors.black,
             fontWeight: FontWeight.bold

         ),
         backgroundColor: Colors.grey,
         textCancel: "No",
         cancelTextColor: Colors.white,
         textConfirm: "yes",
           confirmTextColor: Colors.white,

         onCancel: (){
           Get.toNamed(Routes.cardScreen);
         },
         onConfirm: (){
           productsMap.clear();

         },
       buttonColor:Get.isDarkMode?Colors.pink:Colors.green,
        );

     }

     get productSubTotal=> productsMap.entries.map((e) => e.key.price * e.value).toList();

     get Total=>productsMap.entries.map((e) => e.key.price*e.value).toList().reduce((value, element) => value+element).toStringAsFixed(2);
     int quantity(){
       if(productsMap.isEmpty)
         {
           return 0;
         }
       else
         {
           return productsMap.entries.map((e) => e.value).toList().reduce((value, element) => value+element);

         }
     }

 }

