import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/logics/controller/cart_controller.dart';
import 'package:untitled/model/products_models.dart';
class CartProduct extends StatelessWidget {
  final myController=Get.find<CartController>();
 final ProductsModel productsModel;
 final int index;
 final int quantity;


  CartProduct({
    required this.productsModel,
    required this.index,
   required this.quantity,

    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20,top: 5),
      height: 130,
      width: 100,
      decoration: BoxDecoration(
        color:Get.isDarkMode?Colors.pink.withOpacity(0.7):Colors.green.withOpacity(0.7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            height: 120,
            width: 100,
            margin: EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              color:Colors.white ,
              borderRadius: BorderRadius.circular(20),
              image:   DecorationImage(
                image: NetworkImage(productsModel.image,
                 ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productsModel.title,
                  style:TextStyle(
                    color: Get.isDarkMode?Colors.white:Colors.black,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ) ,),
                SizedBox(
                  height: 20,
                ),
                Text('\$ ${myController.productSubTotal[index].toStringAsFixed(2)}',
                  style:TextStyle(
                    color: Get.isDarkMode?Colors.white:Colors.black,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ) ,)
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(onPressed: (){
                    myController.removeProductsFromCard(productsModel);

                  },
                      icon: Icon(Icons.remove_circle,color: Get.isDarkMode?Colors.white:Colors.black,)),
                  Text( "$quantity",style:TextStyle(
                  color: Get.isDarkMode?Colors.white:Colors.black,
    overflow: TextOverflow.ellipsis,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    ) ,),
                  IconButton(onPressed: (){
                   myController.addProductToCard(productsModel);

                  },
                      icon: Icon(Icons.add_circle,color:Get.isDarkMode?Colors.white:Colors.black,)),

                ],
              ),
              IconButton(onPressed: (){

                myController.removeOneProduct(productsModel);
              },
                icon: Icon(Icons.delete,size: 30,color: Colors.red),)
            ],
          ),

        ],
      ),

    );
  }
}
