import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/view/widget/setting/LogOutWidget..dart';
import 'package:untitled/view/widget/setting/dark_mode.dart';
import 'package:untitled/view/widget/setting/language_widget.dart';
import 'package:untitled/view/widget/setting/profile_widget.dart';
import 'package:untitled/view/widget/text_utils.dart';

import '../../logics/controller/theme_controller.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:context.theme.backgroundColor,

      body: ListView(
        padding:EdgeInsets.all(24),
        children: [
             ProfileWidget(),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Get.isDarkMode?Colors.white:Colors.grey,
            thickness: 2,


          ),
          SizedBox(
            height: 20,
          ),
          MyText(fontWeight:FontWeight.bold,
            text: 'General'.tr,
            color: Get.isDarkMode?Colors.pink:Colors.green,
            fontSize: 20,
          ),
          SizedBox(
            height: 20,
          ),
       DarkModeWidget(),
          SizedBox(
            height: 20,
          ),
          LanguageWidget(),
          SizedBox(
            height: 20,
          ),

          InkWell(
            onTap: (){},
              child: LogOutWidget()),
        ],
      ),
    );
  }
}