import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:get/get.dart';
import 'package:untitled/logics/controller/product_controller.dart';
import 'package:untitled/view/widget/text_utils.dart';

class ClothesInfo extends StatelessWidget {
  final String title;
  final int productId;
  final  double rate;
  final String  description;
   ClothesInfo({
     required this.description,
     required this.rate,
     required this.title,
     required this.productId,
     Key? key}) : super(key: key);
   final controller=Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text('${title}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  color: Get.isDarkMode?Colors.white:Colors.black,
                ),),
              ),
              Obx(() => Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Get.isDarkMode?Colors.white30:Colors.grey,
                ),
                child: InkWell(
                  onTap: (){
                    controller.ManageFavorites(productId);
                  },
                  child:controller.isFavorites(productId)? Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 20,):
                  Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 20,),
                )
                ,
              ))
            ],

          ),
          Row(
            children: [
              MyText(fontWeight: FontWeight.bold, fontSize: 20, text: '${rate}', color: Get.isDarkMode?Colors.white:Colors.black),
              SizedBox(
                width: 8,
              ),
              Row(
                children: [
                  Icon(Icons.star,size: 20,color: Colors.amber,),
                  Icon(Icons.star,size: 20,color: Colors.amber,),

                  Icon(Icons.star_half,size: 20,color: Colors.amber,),
                ],
              )

            ],
          ),
          SizedBox(
            height: 20,
          ),
          ReadMoreText(
            description,
            trimLines: 3,
            textAlign: TextAlign.justify,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show More',
            trimExpandedText: 'Show Less',
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              height: 2,
              color: Get.isDarkMode?Colors.pink:Colors.green,
            ),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              height: 1.5,
              color: Get.isDarkMode?Colors.white:Colors.black,),
            moreStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                height: 2,
                color: Get.isDarkMode?Colors.pink:Colors.green,)

          ),

        ],

      ),
    );
  }
}


