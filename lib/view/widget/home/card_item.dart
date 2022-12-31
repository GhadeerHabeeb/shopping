import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/logics/controller/cart_controller.dart';
import 'package:untitled/logics/controller/product_controller.dart';
import 'package:animate_do/animate_do.dart';
import 'package:untitled/model/products_models.dart';
import 'package:untitled/view/screen/auth/products_details_screen.dart';

class CardItems extends StatelessWidget {
  CardItems({Key? key}) : super(key: key);

  final controller=Get.find<ProductController>();
 final cartController=Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if(controller.isLoading.value)
        {
          return Center(
            child: CircularProgressIndicator(
              color:Get.isDarkMode? Colors.pink:Colors.green,
            ),
          );
        }
      else
        {
          return Expanded(
            child:controller.searchList.isEmpty&&controller.searchTextController.text.isNotEmpty?
                Container(
                  height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Lottie.network("https://assets5.lottiefiles.com/packages/lf20_qyb2cbhe.json",fit: BoxFit.cover)):
            GridView.builder(
                itemCount: controller.searchList.isEmpty?controller.productsList.length:controller.searchList.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 9.0,
                  crossAxisSpacing: 6.0,
                  maxCrossAxisExtent: 200,
                ),
                itemBuilder: (context,index){
                  if(controller.searchList.isEmpty)
                    {
                      return
                        FadeInRight(
                          child: buildCardItems(
                              image: controller.productsList[index].image,
                              price: controller.productsList[index].price,
                              rate: controller.productsList[index].rating.rate,
                              productId: controller.productsList[index].id,
                              productsModel: controller.productsList[index],
                              onTap: () {
                                Get.to(() => ProductDetailsScreen(
                                  productsModel: controller.productsList[index],
                                ));
                              }),
                        );
                    }
                  else {
                  return FadeInRight(
                    child: buildCardItems(
                        image: controller.searchList[index].image,
                        price: controller.searchList[index].price,
                        rate: controller.searchList[index].rating.rate,
                        productId: controller.searchList[index].id,
                        productsModel: controller.searchList[index],
                        onTap: () {
                          Get.to(() => ProductDetailsScreen(
                                productsModel: controller.searchList[index],
                              ));
                        }),
                  );
                }
              }
            ),
          );
        }
    } );
  }
  Widget buildCardItems({
    required String image,
    required double price,
    required double rate,
    required int productId,
    required ProductsModel productsModel,
    required Function() onTap,

  })
  {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap:onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),

            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              )
            ]
          ),
          child: Column(
            children: [
             Obx(() =>  Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 IconButton(
                     onPressed:(){
                       controller.ManageFavorites(productId);
                     },
                     icon:controller.isFavorites(productId)?
                     Icon(Icons.favorite,
                       color: Colors.red,
                     ):Icon(Icons.favorite,
                       color: Colors.grey,
                     )),
                 IconButton(
                     onPressed:(){
                       cartController.addProductToCard(productsModel);
                     },
                     icon: Icon(Icons.shopping_cart,
                       color: Colors.black,
                     ))
               ],
             ),
             ),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network( image,
                fit: BoxFit.fitWidth,),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${price}",style:TextStyle(fontSize: 22,color:Get.isDarkMode? Colors.white:Colors.black,fontWeight: FontWeight.bold) ,),
                  Container(
                    width: 45,
                    height: 20,
                    decoration: BoxDecoration(
                      color:Get.isDarkMode? Colors.pink:Colors.green,
                      borderRadius: BorderRadius.circular(10),

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${rate}',style: TextStyle(fontSize: 14,color: Colors.white),),
                        Icon(Icons.star,color: Colors.white,size: 14,)
                      ],
                    ),

                     ),


                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
