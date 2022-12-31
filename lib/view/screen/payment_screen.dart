import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/logics/controller/cart_controller.dart';
import 'package:untitled/logics/controller/paymentController.dart';
import 'package:untitled/view/widget/Delivery_widget.dart';
import 'package:untitled/view/widget/payment_widget.dart';
import 'package:untitled/view/widget/text_utils.dart';
import 'package:lottie/lottie.dart';
class PaymentScreen extends StatelessWidget {
    PaymentScreen({Key? key}) : super(key: key);
  final myController=Get.find<CartController>();
  final controller=Get.find<PayMentController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("PayMent" ),
        elevation: 0,
        backgroundColor: Get.isDarkMode?Colors.black:Colors.green,

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              MyText(fontWeight:FontWeight.bold, fontSize: 24, text: "Shopping to", color: Get.isDarkMode?Colors.white:Colors.black),
              SizedBox(
                height: 20,
              ),
              DeliveryContineWidget(),
              SizedBox(
                height: 20,
              ),
              MyText(fontWeight:FontWeight.bold, fontSize: 24, text: "Payment", color: Get.isDarkMode?Colors.white:Colors.black),
              SizedBox(
                height: 20,
              ),
               PaymentMethodWidget(),
              SizedBox(
                height: 30,
              ),
              //Total(),
               Center(
                 child: MyText(fontWeight: FontWeight.bold, fontSize: 25, text: 'Total: ${myController.Total}\$', color: Get.isDarkMode?Colors.white:Colors.black),

               ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                      primary: Get.isDarkMode?Colors.pink:Colors.green,
                    ),
                    onPressed: (){
                       Get.defaultDialog(
                           title: 'Are you sure to continue?',
                          backgroundColor: Colors.white,
                          textConfirm: "Yes",
                          textCancel: "No",
                          cancelTextColor:Get.isDarkMode?Colors.pink:Colors.green,
                          confirmTextColor: Colors.white,
                          buttonColor:Get.isDarkMode?Colors.pink:Colors.green,
                          barrierDismissible: false,
                          radius: 15,
                          onConfirm: (){
                            if(controller.phoneNumber.isEmpty)
                                {
                                  Get.defaultDialog(
                                       title: 'Please enter your number...' ,
                                       titleStyle: TextStyle(
                                         fontSize: 22,
                                         fontWeight: FontWeight.w700,
                                         color: Colors.green,
                                       )


                                  );


                                   }
                                else
                                  {
                                    Get.defaultDialog(
                                        title: 'Your payment is sucsses' ,
                                        middleText:'Thank you',
                                        titleStyle: TextStyle(

                                          fontSize: 22,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.green,
                                        ),
                                        content:Column(

                                          children: [
                                            Lottie.network('https://assets5.lottiefiles.com/packages/lf20_k6ciq2nn.json'),
                                          ],
                                        )
                                    );
                                  }
                              },

                          content:  Stack(
                            children: [
                               SizedBox(

                                   child: MyText(fontWeight:FontWeight.bold, fontSize: 22, text: 'you used ${controller.cart} Cart to pay ', color: Colors.black)),
                               Lottie.network("https://assets5.lottiefiles.com/packages/lf20_g3ki3g0v.json",fit: BoxFit.cover),
                            ],
                          )
                       );

                    },
                    child: Text(
                      'Pay Now',
                      style: TextStyle(fontSize: 22,color: Colors.white),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
