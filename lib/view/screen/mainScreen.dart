

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/logics/controller/Main_controller.dart';
import 'package:untitled/logics/controller/cart_controller.dart';
import 'package:untitled/routes/route.dart';
import 'package:untitled/utilis/themes.dart';
import 'package:animate_do/animate_do.dart';
class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final controller = Get.find<MainController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(() {
          return Scaffold(
            backgroundColor:context.theme.backgroundColor,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Get.isDarkMode ? darkColor : mainColor,
              leading: Container(),
              actions: [
                Obx(() =>Badge(
                  position: BadgePosition.topEnd(top: 0, end: 3),
                  animationDuration: Duration(milliseconds: 300),
                  animationType: BadgeAnimationType.slide,
                  badgeContent: Text(
                    cartController.quantity().toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  child:
                  IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.cardScreen);

                      },
                      icon: Icon(Icons.shopping_basket_sharp,color: Colors.white,)),
                ) )


              ],
              title: Text('${controller.title[controller.currentIndex.value]}'),
              centerTitle: true,


            ),

            bottomNavigationBar: FadeInUp(
              child: BottomNavigationBar(
                backgroundColor: Get.isDarkMode ? darkColor :mainColor ,
                currentIndex: controller.currentIndex.value,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                      activeIcon: Icon(Icons.home,
                        color: Get.isDarkMode ? Colors.pink : Colors.black,),
                      icon: Icon(Icons.home,
                        color: Get.isDarkMode ? Colors.white : Colors.white,),
                      label: ''
                  ),
                  BottomNavigationBarItem(
                      activeIcon: Icon(Icons.category,
                        color: Get.isDarkMode ? Colors.pink : Colors.black,),
                      icon: Icon(Icons.category,
                        color: Get.isDarkMode ?  Colors.white : Colors.white,),
                      label: ''
                  ),
                  BottomNavigationBarItem(
                      activeIcon: Icon(Icons.favorite,
                        color: Get.isDarkMode ? Colors.pink : Colors.black,),
                      icon: Icon(Icons.favorite,
                        color: Get.isDarkMode ?  Colors.white : Colors.white,),
                      label: ''
                  ), BottomNavigationBarItem(
                      activeIcon: Icon(Icons.settings,
                        color: Get.isDarkMode ? Colors.pink : Colors.black,),
                      icon: Icon(Icons.settings,
                        color: Get.isDarkMode ?  Colors.white : Colors.white,),
                      label: ''
                  ),

                ],
                onTap: (index) {
                  controller.currentIndex.value=index;
                },
              ),
            ),
            body: IndexedStack(
              index: controller.currentIndex.value,
              children:controller.tabs.value,
            ),
          );
        }


        )

    );
  }


}
