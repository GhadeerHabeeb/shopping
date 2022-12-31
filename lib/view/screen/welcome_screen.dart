import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/routes/route.dart';

import '../widget/text_utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
final bool c=true;
final Color Co=Colors.white;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
        body: Stack(
          children: [

            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.network('https://images.unsplash.com/photo-1581338834647-b0fb40704e21?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',fit: BoxFit.cover,),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black.withOpacity(0.2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    height: 60,
                    width: 190,
                    decoration: BoxDecoration(
                      color:Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child:MyText(text:'Welcome',fontSize: 35,fontWeight: FontWeight.bold,color: Colors.white,),

                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: 230,
                    decoration: BoxDecoration(
                      color:Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(text:'Astroo',fontSize: 35,fontWeight: FontWeight.bold,color: Get.isDarkMode?Colors.pink:Colors.green,),
                        SizedBox(
                          width: 10,
                        ),
                        MyText(text:'Shop',fontSize: 35,fontWeight: FontWeight.bold,color: Colors.white,),

                      ],

                    ),
                    ),
                  SizedBox(
                    height: 250,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary:  Get.isDarkMode?Colors.pink:Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      padding:EdgeInsets.symmetric(horizontal: 40,vertical: 12)
                    ),
                    onPressed: (){
                      Get.offNamed(Routes.loginScreen);
                    },
                    child:MyText(text: 'Get Start',fontSize:22 ,fontWeight: FontWeight.bold,color:Colors.white,) ,),
                SizedBox(
                  height: 30,
                ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyText(fontWeight: FontWeight.bold, fontSize: 18, text:"Don't have a passworld", color:  Get.isDarkMode?Colors.black:Colors.white),
                     TextButton(onPressed: (){
                       Get.offNamed(Routes.signupScreen);
                     }, child: MyText(text: 'Sign up',fontWeight: FontWeight.normal,fontSize: 18,color:Colors.white,),
                    style: TextButton.styleFrom(
                      backgroundColor: Get.isDarkMode?Colors.pink:Colors.green,
                    ), )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
