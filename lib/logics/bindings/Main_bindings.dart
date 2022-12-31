import 'package:get/get.dart';
import 'package:untitled/logics/controller/Main_controller.dart';
import 'package:untitled/logics/controller/paymentController.dart';
import 'package:untitled/logics/controller/setting_controller.dart';

class MainBindings extends Bindings{
  @override
  void dependencies(){
    Get.put(MainController());
    Get.put(SettingController());
    Get.put(PayMentController());
  }

}
