import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/logics/controller.dart';
import 'package:untitled/routes/route.dart';
import 'package:untitled/utilis/4.1%20my_string.dart';

import '../../widget/auth/Container_under.dart';
import '../../widget/auth/auth_text_from_fild.dart';
import '../../widget/auth/check_widget.dart';
import '../../widget/auth_button.dart';
import '../../widget/text_utils.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({Key? key}) : super(key: key);
  final formKey=GlobalKey<FormState>();


  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();



  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
          backgroundColor:context.theme.backgroundColor,
          appBar: AppBar(
            backgroundColor:Get.isDarkMode?Colors.black:Colors.white,
            elevation: 0,
          ),

          body:
          SingleChildScrollView(
            child: Column(

              children: [
                Container(
                  width: double.infinity,
                  color: Get.isDarkMode?Colors.black:Colors.white,
                  height: MediaQuery.of(context).size.height/1.3,
                  child: Padding(
                    padding: EdgeInsets.only(left: 25,right: 25,top: 40),
                    child: Form(
                      key:formKey ,
                      child: Column(


                        children: [
                          Row(
                            children: [
                              MyText(fontWeight:FontWeight.w500, fontSize: 28, text: 'LOG', color:Get.isDarkMode?Colors.pink:Colors.green,),
                              SizedBox(
                                width: 3,
                              ),
                              MyText(fontWeight:FontWeight.w500, fontSize: 28, text: 'IN', color:Get.isDarkMode?Colors.white:Colors.black),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          AuthTextFromFild(controller: emailController,
                            obscureText: false,
                            validation: (value){
                              if(!RegExp(validationEmail).hasMatch(value)
                              )
                              {
                                return 'enter valid email';
                              }
                              else
                              {
                                return null;
                              }
                            },
                            prefixIcon:Icon(Icons.email,color: Get.isDarkMode?Colors.pink:Colors.green,) ,
                            suffixIcon: Text(''),hintText: 'Email',),
                          SizedBox(
                            height: 20,
                          ),
                          GetBuilder<AuthController>(builder: (controller){
                            return AuthTextFromFild(controller: passwordController,
                              obscureText:controller.isVisibilty?false:true,
                              validation: (value){
                                if(value.toString().length<6)
                                {
                                  return 'more than 6';
                                }
                                else
                                {
                                  return null;
                                }
                              },
                              prefixIcon:Icon(Icons.password,color: Get.isDarkMode?Colors.pink:Colors.green,) ,
                              suffixIcon: IconButton(onPressed:
                                  (){
                                controller.visibilty();

                              }, icon:controller.isVisibilty? Icon(Icons.visibility,color: Colors.black,):Icon(Icons.visibility_off,color: Colors.black,)),hintText: 'password',);

                          }),
                          SizedBox(
                            height: 50,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(

                              ),
                              TextButton(
                                onPressed: (){
                                  Get.toNamed(Routes.forgotPassword);
                                },
                                child:Text('ForgetPassword',style:TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                                  decoration: TextDecoration.underline,



                                ),


                                ),

                              ),
                            ],
                          ),
                          SizedBox(
                            height:20,
                          ),
                          AuthButton(text: 'LogIn',onPressed: (){Get.toNamed(Routes.mainScreen);},),
                          SizedBox(
                            height:20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              MyText(fontWeight: FontWeight.bold, fontSize: 20, text: 'OR', color: Colors.white),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height:30,
                                    child:IconButton(onPressed: (){}, icon: Icon(Icons.facebook,color: Colors.blue,size: 50,)),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  SizedBox(
                                    height:30,
                                    child:IconButton(onPressed: (){}, icon: Icon(Icons.snapchat,color: Colors.yellowAccent,size: 50,)),
                                  ),
                                ],
                              ),

                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height:40,
                ),
                ContainerUnder(text: "Don't have an account",onPressed: (){
                  Get.offNamed(Routes.signupScreen);
                },TextType: 'SignUp',),

              ],
            ),
          )
      ),
    );
  }
}
