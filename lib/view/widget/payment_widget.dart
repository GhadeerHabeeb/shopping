import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/logics/controller/paymentController.dart';
import 'package:untitled/view/widget/text_utils.dart';

class PaymentMethodWidget extends StatefulWidget {
  const PaymentMethodWidget({Key? key}) : super(key: key);

  @override
  State<PaymentMethodWidget> createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  int radioContainerIndex=1;
  final controller=Get.find<PayMentController>();
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left: 15,right:15),
      child: Column(
        children: [
          buildRadioPayment
            (
            name: 'Paypal',
            image: 'https://africa.visa.com/dam/VCOM/regional/cemea/genericafrica/global-elements/cards/classic.jpg',
            value: 1,
            onChanged: (int?value){

              controller.cart="PayPal";
              print(controller.cart);
              setState(() {
                radioContainerIndex=value!;

              });
            }

          ),

         SizedBox(
          height: 20,
         ),


          buildRadioPayment
            (
              name: 'Google',
              value: 2,
              image: 'https://play-lh.googleusercontent.com/6UgEjh8Xuts4nwdWzTnWH8QtLuHqRMUB7dp24JYVE2xcYzq4HA8hFfcAbU-R-PC_9uA1',
              onChanged: (int?value){
                controller.cart="Google";
                setState(() {
                  print(controller.cart );
                  radioContainerIndex=value!;
                });
              }

          ),
        ],
      ),
    );
  }

  Widget buildRadioPayment({
    required String name,
    required String image,
    required int value,
    required Function onChanged,}){
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.grey.shade300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(image),
              SizedBox(
                width:10,
              ),
              MyText(fontWeight: FontWeight.bold, fontSize: 25, text: name, color: Colors.black),
              
            ],
          ),
          Radio(value: value,
              groupValue: radioContainerIndex,
              fillColor: MaterialStateColor.resolveWith((states) => Colors.green),
              onChanged: (int?value){
              onChanged(value);
              })
        ],
      ),
    );
  }
}
