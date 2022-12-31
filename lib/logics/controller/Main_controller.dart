import 'package:get/get.dart';
import 'package:untitled/view/screen/HomeScreen.dart';
import 'package:untitled/view/screen/categoryScreen.dart';
import 'package:untitled/view/screen/favorateScreen.dart';
import 'package:untitled/view/screen/settingScreen.dart';
//data always change we use =>obx
class MainController extends GetxController{

RxInt currentIndex=0.obs;

final tabs=[
  HomeScreen(),
  CategoryScreen(),
  FavorateScreen(),
  SettingScreen(),

].obs;

final title=[
  'AstrooShop',
  'Categories',
  'Favorate',
  'Settings'
];
}