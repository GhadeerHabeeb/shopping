import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:untitled/logics/controller/product_controller.dart';
import 'package:untitled/view/widget/text_utils.dart';
import 'package:lottie/lottie.dart';
class FavorateScreen extends StatelessWidget {
   FavorateScreen({Key? key}) : super(key: key);
  final controller=Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:context.theme.backgroundColor,
     body: Obx((){
       if(controller.favoriteList.isEmpty)
         {
          return Center(
                child:
                Column(
                  children: [
                    SizedBox(
                      height: 400,
                      width: 400,
                      child:Lottie.network('https://assets9.lottiefiles.com/packages/lf20_gTpo48.json'
                      ,fit: BoxFit.cover,),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MyText(fontWeight: FontWeight.bold, fontSize: 20, text: 'Please add your Favorite products.', color:Get.isDarkMode?Colors.white:Colors.black)
                  ],
                ),
              );
         }
       else {
         return  Center(
           child: ListView.separated(
               itemBuilder: (context,index){
                 return buildFavItem(image: controller.favoriteList[index].image,title: controller.favoriteList[index].title,
                     price: controller.favoriteList[index].price,productId:controller.favoriteList[index].id);
               },
               separatorBuilder: (context,index){
                 return Divider(
                   color: Colors.grey,
                   thickness: 1,
                 );
               },
               itemCount: controller.favoriteList.length),
         );

       }

     }),

    );
  }
  Widget buildFavItem(
   {
  required String image,
     required String title,
     required double price,
     required int productId,
}
      )
  {
    return Padding(padding: EdgeInsets.all(10),

     child: SizedBox(
       height: 100,
       width: double.infinity,
       child: Row(
         children: [
           SizedBox(
             child: Card(
               clipBehavior: Clip.antiAlias,
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(10),
               ),
               child: Image.network(image,
               fit: BoxFit.cover,),
             ),
           ),
           SizedBox(
             width: 15,
           ),
           Expanded(
             flex: 10,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 MyText(fontWeight:FontWeight.bold, fontSize: 17, text:title, color: Get.isDarkMode?Colors.white:Colors.black),
                 SizedBox(
                   height: 10,
                 ),
                 MyText(fontWeight:FontWeight.bold, fontSize: 17, text:'${price}', color: Get.isDarkMode?Colors.white:Colors.black),
               ],
             ),
           ),

           IconButton(onPressed: (){
             controller.ManageFavorites(productId);
           },
               icon: Icon(Icons.favorite,size: 30,color: Colors.red,),)
         ],
         
       ),
     ),
    );
  }
}