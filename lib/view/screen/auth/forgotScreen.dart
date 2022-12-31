import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/routes/route.dart';
import 'package:untitled/utilis/4.1%20my_string.dart';
import 'package:untitled/view/widget/auth/auth_text_from_fild.dart';
import 'package:untitled/view/widget/auth_button.dart';
import 'package:untitled/view/widget/text_utils.dart';
import 'package:lottie/lottie.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);
  final formKey=GlobalKey<FormState>();
  final TextEditingController emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child:Scaffold(
          backgroundColor:Get.isDarkMode? Colors.white:Colors.black ,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor:Get.isDarkMode? Colors.white:Colors.black,
            title: Text( 'ForgetPassword',
            style: TextStyle(
              color: Get.isDarkMode?Colors.black:Colors.pink,
            ),
            ),
            leading: IconButton(
              onPressed: (){
                Get.back();
              },
              icon: Icon(Icons.arrow_back,color: Get.isDarkMode?Colors.black:Colors.pink,),
            ),

          ),

      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: (){
                      Get.back();
                    },
                    icon: Icon(Icons.close_rounded,color: Get.isDarkMode?Colors.black:Colors.pink,),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                MyText(fontWeight: FontWeight.normal, fontSize: 18, text: 'If you want to recover your account, then please provide your email id below', color:Get.isDarkMode?Colors.black:Colors.white),
                SizedBox(
                  height: 50,
                ),
                 Lottie.network(
                     'https://assets9.lottiefiles.com/packages/lf20_bnofreve.json',width: 350,height: 250),
                SizedBox(
                  height: 50,
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
                  prefixIcon:Icon(Icons.email,color: Get.isDarkMode?Colors.green:Colors.pink,) ,
                  suffixIcon: Text(''),hintText: 'Email',),

                SizedBox(
                  height: 50,
                ),
                AuthButton(text: 'SEND', onPressed: (){}),
              ],
            ),
          ),
        ),
      ),
        )
    );
  }
}
