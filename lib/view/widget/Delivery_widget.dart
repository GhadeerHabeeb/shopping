

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/logics/controller/paymentController.dart';
import 'package:untitled/view/widget/text_utils.dart';

class DeliveryContineWidget extends StatefulWidget {
  const DeliveryContineWidget({Key? key}) : super(key: key);

  @override
  State<DeliveryContineWidget> createState() => _DeliveryContineWidgetState();
}

class _DeliveryContineWidgetState extends State<DeliveryContineWidget> {
int radioContainerIndex=1;
bool changeColors=false;
final TextEditingController  phoneController=TextEditingController();
final controller=Get.find<PayMentController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContainer(
          adress: 'blanalanalmalmalnalanlnalanlanla',
          name: 'Ghadeer Habeeb',
          phone: '🇮🇶+964 01239586',
          title: 'Astroo Shope',
          value: 1,
          icon: Container(),
          color: changeColors?Colors.white:Colors.grey.shade300,
          onchanged: (int? value)
            {
              setState(() {
                radioContainerIndex=value!;
                changeColors=!changeColors;
              });
            }
        ),
        SizedBox(
          height: 20,
        ),
       Obx(() =>  buildRadioContainer(
           adress: "Address: ${controller.address.value}",
           name: 'Ghadeer Habeeb',
           phone: '🇮🇶+964 '+controller.phoneNumber.value,
           title: 'Delivery',
           value: 2,
           icon: InkWell(
               onTap: (){
                 Get.defaultDialog(
                   title: 'contact us',
                   cancelTextColor: Get.isDarkMode? Colors.pink:Colors.green,
                   confirmTextColor: Colors.white,
                   buttonColor:Get.isDarkMode? Colors.pink:Colors.green,
                   textConfirm: "Save",
                   onConfirm: (){
                     Get.back();
                     controller.phoneNumber.value=phoneController.text;
                   },
                   textCancel: "Cancel",
                   radius: 10,
                   content: Padding(
                     padding: const EdgeInsets.all(16.0),
                     child: TextFormField(
                       controller:phoneController ,
                       maxLength: 11,
                       onFieldSubmitted: (value){
                         phoneController.text=value;
                       },
                       style: TextStyle(
                         color: Colors.black,
                         fontSize: 22,
                         fontWeight: FontWeight.w500,
                       ),

                       keyboardType: TextInputType.text,
                       cursorColor: Get.isDarkMode?Colors.pink:Colors.green,
                       decoration:InputDecoration(
                         suffixIcon:IconButton(
                             onPressed:(){
                               phoneController.clear();
                             },
                             icon:Icon(
                               Icons.close_rounded,
                               color: Colors.grey,)),
                         fillColor:Get.isDarkMode? Colors.pink.withOpacity(0.2):Colors.green.withOpacity(0.2),
                         focusColor: Colors.red,
                         prefixIcon: Icon(Icons.phone,color:Get.isDarkMode?Colors.pink:Colors.green),
                         hintText: 'Enter your phone number...',
                         hintStyle: TextStyle(
                           color: Colors.grey,
                           fontSize: 18,
                           fontWeight: FontWeight.w500,
                         ),
                         filled: true,
                         enabledBorder: OutlineInputBorder(
                           borderSide: BorderSide(color: Colors.white),
                           borderRadius: BorderRadius.circular(20),
                         ),
                         focusedBorder: OutlineInputBorder(
                           borderSide: BorderSide(color: Colors.white),
                           borderRadius: BorderRadius.circular(20),
                         ),
                         focusedErrorBorder: OutlineInputBorder(
                           borderSide: BorderSide(color: Colors.white),
                           borderRadius: BorderRadius.circular(20),
                         ),
                       ) ,
                     ),
                   ),
                 );
               },
               child: Icon(Icons.contact_phone,color: Get.isDarkMode?Colors.pink:Colors.green,)),
           color: changeColors?Colors.grey.shade300:Colors.white,
           onchanged: (int? value)
           {
             setState(() {
               radioContainerIndex=value!;
               changeColors=!changeColors;
             });
             controller.updatePosition();
           }
       ),
       ),

      ],
    );

  }
  Widget buildRadioContainer({
    required Color color,
    required int value,
   required Widget icon,
  required Function onchanged,
  required String name,
  required String title,
  required String phone,
  required String adress}){

    return Container(
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 3.0,
          blurRadius: 5.0,
          
        )
        ]

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
              value: value,
              groupValue: radioContainerIndex,
              onChanged:(int? value) {
                onchanged(value);
              },
          fillColor: MaterialStateColor.resolveWith((states) => Colors.red),),
          SizedBox(
            width: 10,
          ),

          Padding(padding:EdgeInsets.only(top: 10,),
          child:Column(
            crossAxisAlignment:CrossAxisAlignment.start ,
            children: [

              MyText(fontWeight: FontWeight.bold, fontSize: 20, text: title, color: Colors.black),
              SizedBox(
                height: 10,
              ),
              MyText(fontWeight: FontWeight.normal, fontSize: 15, text: name, color: Colors.black),
              SizedBox(
                height: 5,
              ),
              Row(

                children: [
                  MyText(fontWeight: FontWeight.normal, fontSize: 15, text: phone, color: Colors.black),

                    SizedBox(
                       width: 120,
                    ),
                  SizedBox(
                      child: icon,
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              MyText(fontWeight: FontWeight.normal, fontSize: 15, text: adress, color: Colors.black),
            ],
          ),
          )

        ],
      ),
    );
  }
}

