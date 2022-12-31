import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:untitled/language/localization.dart';
//import 'package:get_storage/get_storage.dart';

import 'package:untitled/logics/controller/theme_controller.dart';
import 'package:untitled/routes/route.dart';
import 'package:untitled/utilis/4.1%20my_string.dart';
import 'package:untitled/utilis/themes.dart';
import 'package:untitled/view/screen/welcome_screen.dart';

import 'language/en.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());

//await GetStorage.init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: 'astroo food',
      locale: Locale( 'lang'),
      fallbackLocale: Locale(eng),
      translations: LocalizationApp(),
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.light,
      //themeMode: ThemeController().themeDateGet,
      darkTheme: ThemeApp.dark,
      initialRoute: Approute.welcome,
      getPages:Approute.route,
    );
  }
}
