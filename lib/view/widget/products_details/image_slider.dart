import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled/logics/controller/cart_controller.dart';
import 'package:untitled/routes/route.dart';
import 'package:untitled/view/widget/products_details/color_picture.dart';

List colorSelected=<Color>[Colors.white,Colors.yellowAccent,Colors.cyan,Colors.orange,Colors.black12];
Color primaryColor=colorSelected[0];

class ImageSlide extends StatefulWidget {
  CarouselController carouselController=CarouselController();
  final cartController=Get.find<CartController>();
  final String imageUrl;

    int currentpage=0;
  int currentColor=0;
  ImageSlide(
      {
        required this.imageUrl,
        Key? key}) : super(key: key);

  @override
  State<ImageSlide> createState() => _ImageSlideState();
}

class _ImageSlideState extends State<ImageSlide> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
            itemCount: 3,
            carouselController:widget.carouselController ,
            options:CarouselOptions(
            height: 500,
            autoPlay: true,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            autoPlayInterval: Duration(seconds: 2),
            viewportFraction: 1,
              onPageChanged: (index,reson){
              setState(() {
                widget.currentpage=index;
              });
              }

    ),
            itemBuilder: (context,index,realIndex){
              return Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                   
                  borderRadius: BorderRadius.circular(25),


                ),
                child: Image.network(

                  widget.imageUrl,fit: BoxFit.cover,color: primaryColor,
                  colorBlendMode: BlendMode.hue,),
              );
            },
           ),
        Positioned(
          bottom: 30,
            left: 150,
            child:AnimatedSmoothIndicator(
          activeIndex:widget.currentpage ,
          count: 3,
          effect: ExpandingDotsEffect(
            activeDotColor:Get.isDarkMode?Colors.pink:Colors.green,
            dotHeight: 10,
            dotWidth: 10,
            dotColor: Get.isDarkMode?Colors.pink:Colors.green,

          ),
        )),
      Positioned(
      bottom: 30,
          right: 4,
          child: Container(
        height: 200,
        width: 50,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(30),
        ),
            child: ListView.separated(
                itemBuilder: (context,index){
                  return  GestureDetector(
                    onTap: (){
                      setState(() {
                        widget.currentColor=index;

                          primaryColor = colorSelected[index];

                      });

                    },
                    child: ColorPicker(
                        outerBorder:widget.currentColor==index ,
                        color:colorSelected[index]),
                  );
                },
                separatorBuilder: (context,index)=>
                  SizedBox(
                    height:3 ,
                  ),

                itemCount:colorSelected.length),
      ),
      ),
        Container(
          padding:const EdgeInsets.only(
            top: 20,
            left: 25,
            right: 25,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode?Colors.pink.withOpacity(0.8):Colors.green.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(padding: EdgeInsets.only(left: 5),
                  child: Icon(Icons.arrow_back_ios,color: Colors.white,size: 20,),),

                ),
              ),
              Obx(()=>Badge(
                position: BadgePosition.topEnd(top: -10, end: -10),
                animationDuration: Duration(milliseconds: 300),
                animationType: BadgeAnimationType.slide,
                badgeContent: Text(
                 widget.cartController.quantity().toString(),
                  style: TextStyle(color: Colors.white),
                ),

                child: InkWell(
                  onTap: (){
                    Get.toNamed(Routes.cardScreen);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Get.isDarkMode?Colors.pink.withOpacity(0.8):Colors.green.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(padding: EdgeInsets.all(2),
                      child: Icon(Icons.shopping_basket,color: Colors.white,size: 20,),),

                  ),
                ),

    )
    )
            ],
          ),
        )
      ],
    );
  }
}

