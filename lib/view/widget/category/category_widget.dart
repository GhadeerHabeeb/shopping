import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/logics/controller/category_controller.dart';
import 'package:untitled/view/widget/category/catecory_items.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({Key? key}) : super(key: key);
  final controller=Get.find<CategoryController>();
  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: ListView.separated
        (itemBuilder: (context,index){
          return InkWell(
            onTap: ()async{
              await controller.getCategoryIndex(index);
              Get.to(()=>CategoryItems(categoryTitle: controller.categoryNameList[index],));
            },
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
                image:DecorationImage(
                 image: NetworkImage(
                   controller.categoryImageList[index],
                 ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(padding:EdgeInsets.only(left: 20,bottom: 10,
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(controller.categoryNameList[index],style: TextStyle(
                  backgroundColor: Colors.black38,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),


              ),),
            ),
          );
      },
          separatorBuilder: (context,index){
          return SizedBox(
            height: 20,
          );
          },
          itemCount: controller.categoryNameList.length),
    );
    }

}
