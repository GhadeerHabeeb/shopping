import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/logics/controller/setting_controller.dart';
import 'package:untitled/logics/controller/theme_controller.dart';
import 'package:untitled/view/widget/text_utils.dart';
import 'package:animate_do/animate_do.dart';
class DarkModeWidget extends StatelessWidget {
    DarkModeWidget({Key? key}) : super(key: key);

  final controller=Get.find<SettingController>();
  @override
  Widget build(BuildContext context) {
    return Obx(()=>
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildIconWidget(),
        Switch(
          activeTrackColor:Get.isDarkMode?Colors.pink:Colors.green,
            activeColor: Get.isDarkMode?Colors.pink:Colors.green,  
            value: controller.switchValue.value,
            onChanged: (value){
          Get.isDarkMode?Get.changeThemeMode(ThemeMode.light):Get.changeThemeMode(ThemeMode.dark);
         controller.switchValue.value=value;
        })
      ],
    )
    );
  }
  Widget buildIconWidget(){
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:Get.isDarkMode? Colors.white:Colors.black,
            ),
            child:FadeInUp(
              duration: Duration(seconds: 2),
                child: Icon(Get.isDarkMode?Icons.light_mode:Icons.dark_mode,color:Get.isDarkMode?Colors.amber:Colors.white,)),

          ),
          SizedBox(
            width: 20,
          ),
          MyText(fontWeight: FontWeight.bold,text:Get.isDarkMode? 'LightMode'.tr:'DarkMode'.tr,fontSize: 22,color: Get.isDarkMode?Colors.white:Colors.black,),
        ],
      ),
    );
  }
}
