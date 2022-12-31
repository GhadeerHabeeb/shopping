import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/logics/controller/cart_controller.dart';
import 'package:untitled/view/widget/card/card_product_card.dart';
import 'package:untitled/view/widget/card/cart_total.dart';
import 'package:untitled/view/widget/card/empty_card.dart';

class CardScreen extends StatelessWidget {

  CardScreen({Key? key}) : super(key: key);
  final myController=Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Card Items"),
        elevation: 0,
        backgroundColor: Get.isDarkMode?Colors.black:Colors.green,
        actions: [
          IconButton(onPressed: (){
            myController.clearProduct();
          },
              icon: Icon(Icons.backspace)),
        ],
      ),
      body:
        Obx((){
          if(myController.productsMap.isEmpty)
            {
              return EmptyCart();
            }
          else
            {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 600,
                  child: ListView.separated
                    (itemBuilder: (context,index){
                    return CartProduct(
                      productsModel:myController.productsMap.keys.toList()[index] ,
                      index:index,
                      quantity: myController.productsMap.values.toList()[index],);
                  },
                      separatorBuilder: (context,index)=>const SizedBox(
                        height: 20,),
                      itemCount: myController.productsMap.length),
                ),
                Padding(padding: EdgeInsets.only(bottom: 30,),
                  child: CartTotal(),
                ),
              ],
            ),
          );}

        }

      ),
    )
    );
  }
}
