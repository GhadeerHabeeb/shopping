import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled/routes/route.dart';


class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.network('https://assets9.lottiefiles.com/packages/lf20_3VDN1k.json'),
          SizedBox(
            height: 40,
          ),
          RichText(text: TextSpan(
           children: [
             TextSpan(
                 text: "your Cart is ",
                style: TextStyle(
                  color:Get.isDarkMode?Colors.white:Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )
             ),
             TextSpan(
                 text: "Empty ",
                 style: TextStyle(
                   color:Get.isDarkMode?Colors.pink:Colors.green,
                   fontSize: 30,
                   fontWeight: FontWeight.bold,
                 )
             ),
           ]
          ),),
          SizedBox(
            height: 10,
          ),
          Text('Add item to get started',style: TextStyle(
            color:Get.isDarkMode?Colors.white:Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          )),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 50,
              child: ElevatedButton(
                onPressed: (){
                  Get.toNamed(Routes.mainScreen);
                },
                child: Text('Go to home',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),

                  ),
                  elevation: 0,
                  primary: Get.isDarkMode?Colors.pink:Colors.green,
                ),

              ))
        ],
      ),
    );
  }
}
