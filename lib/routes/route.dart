import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/logics/bindings/Auth_bindeng.dart';
import 'package:untitled/logics/bindings/Main_bindings.dart';
import 'package:untitled/logics/bindings/productBinding.dart';
import 'package:untitled/logics/controller/product_controller.dart';
import 'package:untitled/view/screen/auth/forgotScreen.dart';
import 'package:untitled/view/screen/auth/login.dart';
import 'package:untitled/view/screen/auth/signup.dart';
import 'package:untitled/view/screen/card_screen.dart';
import 'package:untitled/view/screen/mainScreen.dart';
import 'package:untitled/view/screen/payment_screen.dart';
import 'package:untitled/view/screen/welcome_screen.dart';

class Approute{

  //init route
  static const welcome=Routes.welcomeScreen;
  //getPages

static final route=[
  GetPage(name: Routes.welcomeScreen, page: ()=> WelcomeScreen()),
  GetPage(name: Routes.loginScreen, page: ()=> LogInScreen(),binding: AuthBindeng()),
  GetPage(name: Routes.signupScreen, page: ()=> SignUpScreen(),binding: AuthBindeng()),
  GetPage(name: Routes.forgotPassword, page: ()=> ForgotPassword(),binding: AuthBindeng()),
  GetPage(name: Routes.mainScreen, page: ()=> MainScreen(),bindings: [AuthBindeng(),MainBindings(),ProductBindings()]),
  GetPage(name: Routes.cardScreen, page: ()=> CardScreen(),bindings: [AuthBindeng(),ProductBindings()]),
  GetPage(name: Routes.paymentScreen, page: ()=> PaymentScreen(),bindings: [AuthBindeng(),MainBindings(),ProductBindings()]),
];

}

class Routes{
  static const welcomeScreen='/welcomeScreen';
  static const loginScreen='/loginScreen';
  static const signupScreen='/signupScreen';
  static const forgotPassword='/forgotPassword';
  static const mainScreen='/mainScreen';
  static const cardScreen='/cardScreen';
  static const paymentScreen='/paymentScreen';


}