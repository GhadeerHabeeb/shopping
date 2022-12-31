import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:untitled/logics/controller/setting_controller.dart';
import 'package:untitled/utilis/4.1%20my_string.dart';
import 'package:untitled/view/widget/text_utils.dart';

class LanguageWidget extends StatelessWidget {
    LanguageWidget({Key? key}) : super(key: key);
  final controller=Get.find<SettingController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(builder:(_)=>Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          color: Colors.transparent,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:Colors.red,
                ),
                child:FadeInUp(
                    duration: Duration(seconds: 2),
                    child: Icon(Icons.language,color: Colors.white,)),

              ),
              SizedBox(
                width: 20,
              ),
              MyText(fontWeight: FontWeight.bold,text: 'Language'.tr ,fontSize: 22,color: Get.isDarkMode?Colors.white:Colors.black,),
            ],
          ),

        ),
        Container(
          width: 120,
          padding: EdgeInsets.symmetric(vertical: 2,horizontal: 6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              border: Border.all(
                color:Get.isDarkMode?Colors.white:Colors.black38,
                width: 2,
              )
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(

              iconSize: 25,
              icon: Icon(Icons.arrow_drop_down),
              items: [
                DropdownMenuItem(
                  child: Text('English',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  value:eng,
                ),
                DropdownMenuItem(
                  child: Text('Arabic',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  value:ara,),

              ],

               value: controller.langLocal,
              onChanged: (value){
               controller.changeLanguage(value!);
               Get.updateLocale(Locale(value));
              },

            ),
          ),
        ),
      ],
    )
    );
  }
}
