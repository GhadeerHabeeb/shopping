import 'dart:ui';


import 'package:get/get.dart';
import 'package:untitled/utilis/4.1%20my_string.dart';

class SettingController extends GetxController{

  var switchValue=false.obs;

  var langLocal=eng;

  String capitalized(String profileName){

    return profileName.split(" ").map((name) => name.capitalize).join(" ");

  }
  @override
  void onInit() async{

    super.onInit();

  }
  //language



void changeLanguage(String typeLan){

    if(langLocal==typeLan)
      {
        return;
      }
    else if(typeLan==ara){
      langLocal=ara;


    }else
      {
        langLocal=eng;

      }
    update();
}

}