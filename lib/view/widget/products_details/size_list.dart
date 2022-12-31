import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeList extends StatefulWidget {
  const SizeList({Key? key}) : super(key: key);


  @override
  State<SizeList> createState() => _SizeListState();
}

class _SizeListState extends State<SizeList> {
  var currentSelected=0;
  final List<String>sizeList=['S','M','L','XL','XXL'];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: EdgeInsets.symmetric(horizontal: 25,vertical:20 ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return GestureDetector(
                onTap: (){
                  setState(() {
                    currentSelected=index;
                  });
                },
               child: Container(
                 padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                 decoration: BoxDecoration(
                   color:Get.isDarkMode?currentSelected==index
                       ?Colors.pink.withOpacity(0.8):Colors.black.withOpacity(0.8):currentSelected==index
                        ?Colors.green.withOpacity(0.8):Colors.white.withOpacity(0.8),
                   borderRadius: BorderRadius.circular(15),
                   border: Border.all(
                     color: Colors.grey.withOpacity( 0.4),
                     width: 2,
                   ),
                 ),
                 child: Text(sizeList[index],style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: 22,
                   color:Get.isDarkMode?currentSelected==index? Colors.black:Colors.white:currentSelected==index? Colors.white:Colors.black,
                 ),),
               ),
            );

          }, separatorBuilder: (context,index)=>SizedBox(
        width: 10,
      ),
          itemCount: sizeList.length),
    );
  }
}

