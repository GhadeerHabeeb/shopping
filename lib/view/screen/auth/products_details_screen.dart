import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/model/products_models.dart';
import 'package:untitled/view/widget/products_details/add_cart.dart';
import 'package:untitled/view/widget/products_details/clothes_info.dart';
import 'package:untitled/view/widget/products_details/size_list.dart';

import '../../widget/products_details/image_slider.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductsModel productsModel;
  const ProductDetailsScreen(
      {
        required this.productsModel,
        Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSlide(imageUrl: productsModel.image,),
               ClothesInfo(title: productsModel.title,productId: productsModel.id,
               rate: productsModel.rating.rate,description: productsModel.description,),
               SizeList(),
               AddCart(price: productsModel.price,productsModel: productsModel,),

            ],
          ),
        ),
      ),
    );
  }
}
