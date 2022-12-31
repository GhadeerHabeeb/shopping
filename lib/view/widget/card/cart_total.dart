import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/logics/controller/cart_controller.dart';
import 'package:untitled/routes/route.dart';
import 'package:untitled/view/widget/text_utils.dart';

class CartTotal extends StatelessWidget {
  final myController=Get.find<CartController>();
    CartTotal({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(fontWeight: FontWeight.bold, fontSize: 16, text: 'Total', color: Colors.grey),
              Text("\$ ${myController.Total}",style: TextStyle(
                color: Get.isDarkMode?Colors.white:Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),),

            ],
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: SizedBox(
              height: 60,
              child:ElevatedButton(
                onPressed: (){
                  Get.toNamed(Routes.paymentScreen);
                },

                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 0,
                  primary: Get.isDarkMode?Colors.pink:Colors.green,

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("CheckOut",style: TextStyle(fontSize: 20,color:Colors.white),),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.shopping_cart),

                  ],
                ),
              ) ,
            ),
          )
        ],
      ),
    );
  }
}
