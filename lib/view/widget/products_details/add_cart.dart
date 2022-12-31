import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/logics/controller/cart_controller.dart';
import 'package:untitled/model/products_models.dart';
import 'package:untitled/view/widget/text_utils.dart';

class AddCart extends StatelessWidget {
  final double price;
  final ProductsModel productsModel;
  final controller=Get.find<CartController>();
  AddCart({
    required this.price,
    required this.productsModel,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(fontWeight: FontWeight.bold, fontSize: 16, text: 'Price', color: Colors.grey),
              SizedBox(
                height: 10,
              ),
              Text('\$ $price',style: TextStyle(
                color: Get.isDarkMode?Colors.white:Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 1.5,

              ),)
            ],

      ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                  onPressed: (){
                    controller.addProductToCard(productsModel);
                  },
                  style:ElevatedButton.styleFrom(
                    primary: Get.isDarkMode?Colors.pink:Colors.green,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                  ) ,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Add to Cart',style: TextStyle(
                        color:  Colors.white ,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,


                      ),),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.shopping_cart_outlined,color: Colors.white,size: 22,)
                    ],
                  )),
            ),
          )

        ],
      ),
    );
  }
}
