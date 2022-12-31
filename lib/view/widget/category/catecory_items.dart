
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/logics/controller/cart_controller.dart';
import 'package:untitled/logics/controller/category_controller.dart';
import 'package:untitled/logics/controller/product_controller.dart';
import 'package:animate_do/animate_do.dart';
import 'package:untitled/model/products_models.dart';
import 'package:untitled/view/screen/auth/products_details_screen.dart';

class CategoryItems extends StatelessWidget {
  final String categoryTitle;
  CategoryItems({
    required this.categoryTitle,
    Key? key}) : super(key: key);

  final controller=Get.find<ProductController>();
  final cartController=Get.find<CartController>();
  final Categorycontroller=Get.find<CategoryController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: Text(categoryTitle),
        centerTitle: true,
        backgroundColor: Get.isDarkMode?Colors.pink:Colors.green,
      ),
      body: Obx((){
        if(Categorycontroller.isCategoryLoading.value)
          {
            return Center(
                child: CircularProgressIndicator(
                  color:Get.isDarkMode? Colors.pink:Colors.green, )
            );
          }
        else
          {
            return  GridView.builder(
                itemCount: Categorycontroller.categoryList.length ,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 9.0,
                  crossAxisSpacing: 6.0,
                  maxCrossAxisExtent: 200,
                ),
                itemBuilder: (context,index){

                  return
                    FadeInRight(
                      child: buildCardItems(
                          image: Categorycontroller.categoryList[index].image,
                          price:Categorycontroller.categoryList[index].price,
                          rate: Categorycontroller.categoryList[index].rating.rate,
                          productId: Categorycontroller.categoryList[index].id,
                          productsModel: Categorycontroller.categoryList[index],
                          onTap: () {
                            Get.to(() =>
                                ProductDetailsScreen(
                                  productsModel: Categorycontroller.categoryList[index],
                                ));
                          }),
                    );

                }

            );
          }
      }),
    );
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
